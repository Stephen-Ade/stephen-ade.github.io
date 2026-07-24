import { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import Editor from '@monaco-editor/react';
import './App.css';

const unflattenObject = (obj) => {
  const result = {};
  for (const key in obj) {
    const keys = key.split('.');
    let current = result;
    for (let i = 0; i < keys.length - 1; i++) {
      if (!current[keys[i]]) current[keys[i]] = {};
      current = current[keys[i]];
    }
    current[keys[keys.length - 1]] = obj[key];
  }
  return result;
};

// --- NEW: Text Ingestion Parser ---
const parseTextToConfig = (text) => {
  const lines = text.split('\n');
  const config = {};
  lines.forEach(line => {
    if (!line.trim()) return;
    const match = line.match(/^([^:]+):\s*(.*)$/);
    if (!match) return;
    
    let key = match[1].trim();
    let value = match[2].trim();
    
    // Strip out comments like "(Note: ...)"
    value = value.replace(/\s*\(.*?\)\s*/g, '').trim();
    
    // If there are commas, convert to an array automatically
    if (value.includes(',')) {
      config[key] = value.split(',').map(v => v.trim()).filter(v => v);
    } else {
      config[key] = value;
    }
  });
  return config;
};

const FormField = ({ name, schema, requiredList, formData, setFormData }) => {
  const isRequired = requiredList.includes(name);
  const baseDescription = schema.description || 'No description available.';
  const tooltipText = `${name}: ${baseDescription}${isRequired ? ' (Required)' : ''}`;

  if (schema.type === 'object' && schema.properties) {
    return (
      <div className="form-group nested-group" title={tooltipText}>
        <label className="nested-label">
          {name} {isRequired && <span className="req">*</span>} 
          <span className="type-badge">object</span>
        </label>
        <div className="nested-children">
          {Object.entries(schema.properties).map(([childKey, childSchema]) => (
            <FormField
              key={childKey}
              name={`${name}.${childKey}`}
              schema={childSchema}
              requiredList={schema.required || []}
              formData={formData}
              setFormData={setFormData}
            />
          ))}
        </div>
      </div>
    );
  }

  // FIX: Smart value handling for Arrays
  const currentValue = formData[name];
  let displayValue = '';
  if (Array.isArray(currentValue)) {
    displayValue = currentValue.join(', ');
  } else {
    displayValue = currentValue || '';
  }

  const handleChange = (e) => {
    let val = e.target.value;
    // If schema expects an array, convert comma-separated string back to array
    if (schema.type === 'array') {
      val = val.split(',').map(v => v.trim()).filter(v => v);
    }
    setFormData({ ...formData, [name]: val });
  };

  return (
    <div className="form-group">
      <label title={tooltipText}>
        {name} {isRequired && <span className="req">*</span>}
      </label>
      <input
        type="text"
        title={tooltipText}
        placeholder={`(${schema.type || 'string'})`}
        value={displayValue}
        onChange={handleChange}
      />
    </div>
  );
};

function App() {
  const [resources, setResources] = useState([]);
  const [selectedType, setSelectedType] = useState(null);
  const [schema, setSchema] = useState(null);
  const [formData, setFormData] = useState({});
  const [platform, setPlatform] = useState('terraform');
  const [generatedCode, setGeneratedCode] = useState('// Select a resource and click Generate');
  const [loading, setLoading] = useState(false);
  const fileInputRef = useRef(null); // NEW: Ref for hidden file input

  useEffect(() => {
    axios.get('http://localhost:3001/api/resources').then(res => setResources(res.data));
  }, []);

  useEffect(() => {
    if (!selectedType) return;
    axios.get(`http://localhost:3001/api/schema/${encodeURIComponent(selectedType)}`).then(res => {
      setSchema(res.data);
      setFormData({});
      setGeneratedCode(`// Ready to generate ${selectedType}`);
      setPlatform(res.data.provider === 'azure' ? 'bicep' : 'terraform');
    });
  }, [selectedType]);

  // --- NEW: Handle File Upload ---
  const handleFileUpload = (event) => {
    const file = event.target.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (e) => {
      const text = e.target.result;
      const parsedConfig = parseTextConfig(text);
      
      // Auto-select the PANOS module
      const targetModule = 'panos_security_rule';
      setSelectedType(targetModule);
      
      // Populate the form data (use a small timeout to ensure schema is loaded first)
      setTimeout(() => {
        setFormData(parsedConfig);
        setGeneratedCode(`// Ingested from ${file.name}. Click Generate to compile.`);
      }, 100);
    };
    reader.readAsText(file);
    
    // Reset file input so the same file can be uploaded again if needed
    event.target.value = null; 
  };

  const handleGenerate = async (e) => {
    e.preventDefault();
    if (!selectedType) return;
    setLoading(true);
    
    const cleanConfig = Object.fromEntries(
      Object.entries(formData).filter(([_, v]) => v !== '' && v !== null && !(Array.isArray(v) && v.length === 0))
    );
    
    const nestedConfig = unflattenObject(cleanConfig);

    try {
      const res = await axios.post('http://localhost:3001/api/generate', { 
        typeName: selectedType, 
        platform, 
        config: nestedConfig 
      });
      setGeneratedCode(res.data.code);
    } catch (err) {
      setGeneratedCode(`// Error generating code`);
    }
    setLoading(false);
  };

  const getLanguage = () => {
    const map = { terraform: 'hcl', bicep: 'bicep', 'cdk-python': 'python', cloudformation: 'json' };
    return map[platform] || 'plaintext';
  };

  const platforms = schema?.supportedPlatforms || 
    (schema?.provider === 'aws' ? ['terraform', 'cdk-python', 'cloudformation'] : 
    (schema?.provider === 'gcp' ? ['terraform'] : ['terraform', 'bicep']));

  return (
    <div className="app-container">
      <aside className="sidebar">
        <h3>IaC Resources</h3>
        <input type="text" placeholder="Search..." onChange={(e) => {
          axios.get(`http://localhost:3001/api/resources?search=${e.target.value}`).then(res => setResources(res.data));
        }} />
        <div className="resource-list">
          {resources.map(r => {
            const parts = r.typeName.split('/');
            const formatName = (str) => {
              if (str.startsWith('google_')) {
                return str.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
              }
              return str.charAt(0).toUpperCase() + str.slice(1);
            };
            
            const displayName = r.deviceType || (parts.length > 2 ? `${formatName(parts[parts.length-2])} / ${formatName(parts[parts.length-1])}` : formatName(parts[parts.length-1]));
            return (
              <div key={r.typeName} className={`resource-item ${r.typeName === selectedType ? 'active' : ''}`} onClick={() => setSelectedType(r.typeName)}>
                <span className={`badge ${r.provider}`}>{r.provider === 'external' ? r.vendor : r.provider.toUpperCase()}</span>
                {displayName}
              </div>
            );
          })}
        </div>
      </aside>
      
      <main className="form-panel">
        {schema ? (
          <>
            <h2>{schema.typeName.split('/').pop()}</h2>
            <p className="type-path">{schema.typeName}</p>
            
            <div className="header-actions">
              <div className="platform-selector">
                {platforms.map(p => (
                  <button key={p} onClick={() => setPlatform(p)} className={platform === p ? 'active' : ''}>{p}</button>
                ))}
              </div>
              
              <div className="action-btns">
                <button type="button" className="print-btn" onClick={() => window.print()}>
                  Export PDF
                </button>
                {/* NEW: Text Ingestion Button */}
                <button type="button" className="ingest-btn" onClick={() => fileInputRef.current.click()}>
                  Ingest Text File
                </button>
                <input 
                  type="file" 
                  ref={fileInputRef} 
                  style={{ display: 'none' }} 
                  accept=".txt,.csv,.cfg,.conf" 
                  onChange={handleFileUpload} 
                />
              </div>
            </div>

            <form onSubmit={handleGenerate} className="dynamic-form">
              {Object.entries(schema.properties).map(([key, prop]) => (
                <FormField
                  key={key}
                  name={key}
                  schema={prop}
                  requiredList={schema.required || []}
                  formData={formData}
                  setFormData={setFormData}
                />
              ))}
              <button type="submit" disabled={loading} style={{ marginTop: '20px' }}>
                {loading ? 'Generating...' : 'Generate Code'}
              </button>
            </form>
          </>
        ) : (
          <div className="placeholder">
            <h2>Schema-Driven IaC Generator</h2>
            <p>Select a resource from the left to begin.</p>
          </div>
        )}
      </main>
      
      <section className="code-panel">
        <Editor height="100%" language={getLanguage()} theme="vs-dark" value={generatedCode} options={{ minimap: { enabled: false }, readOnly: true, fontSize: 14 }} />
      </section>
    </div>
  );
}

export default App;