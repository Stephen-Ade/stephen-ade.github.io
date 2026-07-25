import { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import Editor from '@monaco-editor/react';
import './App.css';

// --- HELPER: Normalize name to snake_case for Terraform resource label ---
const normalizeToSnakeCase = (name) => {
  if (!name) return '';
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '_')
    .replace(/^_|_$/g, '');
};

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

// --- UPDATED: Parser that extracts the target module from the text file ---
const parseTextToConfig = (text) => {
  // BULLETPROOF: Strip Windows UTF-8 BOM
  text = text.replace(/^\uFEFF/, '');
  const lines = text.split(/\r?\n/); 
  
  let targetModule = null;
  const config = {};
  
  lines.forEach(line => {
    // Check for module routing tag: @module: panos_address
    const moduleMatch = line.match(/^@module:\s*(.*)$/);
    if (moduleMatch) {
      targetModule = moduleMatch[1].trim();
      return; // Don't process this line as config data
    }

    if (!line.trim()) return;
    const match = line.match(/^([^:]+):\s*(.*)$/);
    if (!match) return;
    
    let key = match[1].trim().replace(/^\uFEFF/, ''); 
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
  
  return { targetModule, config };
};

// --- UPDATED: Enhanced FormField with enum, boolean, and conditional visibility support ---
const FormField = ({ name, schema, requiredList, formData, setFormData }) => {
  const isRequired = requiredList.includes(name);
  const baseDescription = schema.description || '';
  const tooltipText = `${name}: ${baseDescription}${isRequired ? ' (Required)' : ''}`;
  
  // Get display name (last part of dotted path for nested fields)
  const displayName = name.split('.').pop();

  // --- CONDITIONAL VISIBILITY ---
  // Check for visibleWhen: { field: "location.scope_type", value: "device_group" }
  if (schema.visibleWhen) {
    const { field, value } = schema.visibleWhen;
    const fieldValue = formData[field];
    // Hide if the condition field is set but doesn't match
    if (fieldValue !== undefined && fieldValue !== value) {
      return null;
    }
  }

  // --- NESTED OBJECT ---
  if (schema.type === 'object' && schema.properties) {
    return (
      <div className="form-group nested-group" title={tooltipText}>
        <label className="nested-label">
          {displayName} {isRequired && <span className="req">*</span>} 
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

  // --- BOOLEAN FIELD (checkbox) ---
  if (schema.type === 'boolean') {
    return (
      <div className="form-group checkbox-group">
        <label className="checkbox-label" title={tooltipText}>
          <input
            type="checkbox"
            checked={!!formData[name]}
            onChange={(e) => setFormData({ ...formData, [name]: e.target.checked })}
          />
          <span className="checkbox-custom"></span>
          <span>
            {displayName} {isRequired && <span className="req">*</span>}
          </span>
        </label>
        {baseDescription && <span className="help-text">{baseDescription}</span>}
      </div>
    );
  }

  // --- ENUM FIELD (select dropdown) ---
  if (schema.enum && schema.enum.length > 0) {
    return (
      <div className="form-group">
        <label title={tooltipText}>
          {displayName} {isRequired && <span className="req">*</span>}
        </label>
        <select
          className="select-input"
          value={formData[name] || ''}
          onChange={(e) => {
            const newVal = e.target.value;
            const updated = { ...formData, [name]: newVal };
            
            // Auto-clear dependent fields when scope_type changes
            if (name.endsWith('.scope_type') || name === 'scope_type') {
              const basePath = name.includes('.') 
                ? name.substring(0, name.lastIndexOf('.')) 
                : '';
              const dgPath = basePath ? `${basePath}.device_group.name` : 'device_group.name';
              const vsysPath = basePath ? `${basePath}.vsys.name` : 'vsys.name';
              
              if (newVal !== 'device_group') {
                delete updated[dgPath];
              }
              if (newVal !== 'vsys') {
                delete updated[vsysPath];
              }
            }
            
            setFormData(updated);
          }}
          title={tooltipText}
        >
          <option value="">-- Select {displayName} --</option>
          {schema.enum.map(opt => (
            <option key={opt} value={opt}>{opt}</option>
          ))}
        </select>
        {baseDescription && <span className="help-text">{baseDescription}</span>}
      </div>
    );
  }

  // --- ARRAY FIELD (comma-separated input for tags, etc.) ---
  if (schema.type === 'array') {
    const currentValue = formData[name];
    const displayValue = Array.isArray(currentValue) 
      ? currentValue.join(', ') 
      : (currentValue || '');

    return (
      <div className="form-group">
        <label title={tooltipText}>
          {displayName} {isRequired && <span className="req">*</span>}
          <span className="type-badge">array</span>
        </label>
        <input
          type="text"
          title={tooltipText}
          placeholder={`(${schema.items?.type || 'string'}) - comma separated`}
          value={displayValue}
          onChange={(e) => {
            const val = e.target.value
              .split(',')
              .map(v => v.trim())
              .filter(v => v);
            setFormData({ ...formData, [name]: val });
          }}
        />
        {baseDescription && <span className="help-text">{baseDescription}</span>}
      </div>
    );
  }

  // --- DEFAULT: TEXT INPUT (string, number, etc.) ---
  const currentValue = formData[name] || '';

  return (
    <div className="form-group">
      <label title={tooltipText}>
        {displayName} {isRequired && <span className="req">*</span>}
      </label>
      <input
        type="text"
        title={tooltipText}
        placeholder={`(${schema.type || 'string'})`}
        value={currentValue}
        onChange={(e) => setFormData({ ...formData, [name]: e.target.value })}
      />
      {baseDescription && <span className="help-text">{baseDescription}</span>}
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
  const fileInputRef = useRef(null);
  
  const [pendingFormData, setPendingFormData] = useState(null);
  const [ingestTrigger, setIngestTrigger] = useState(0); 

  useEffect(() => {
    axios.get('http://localhost:3001/api/resources').then(res => setResources(res.data));
  }, []);

  useEffect(() => {
    if (!selectedType) return;
    
    axios.get(`http://localhost:3001/api/schema/${encodeURIComponent(selectedType)}`).then(res => {
      setSchema(res.data);
      setPlatform(res.data.provider === 'azure' ? 'bicep' : 'terraform');
      
      if (pendingFormData) {
        setFormData(pendingFormData);
        setGeneratedCode(`// Ingested from text file. Click Generate to compile.`);
        setPendingFormData(null); 
      } else {
        setFormData({});
        setGeneratedCode(`// Ready to generate ${selectedType}`);
      }
    });
  }, [selectedType, ingestTrigger]);

  // --- UPDATED: File Upload Handler that uses the dynamic module ---
  const handleFileUpload = (event) => {
    const file = event.target.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (e) => {
      const text = e.target.result;
      const { targetModule, config } = parseTextToConfig(text);
      
      // 1. Store parsed data
      setPendingFormData(config);
      // 2. Switch to the extracted module, or fallback to security policy rules
      setSelectedType(targetModule || 'panos_security_policy_rules');
      // 3. Bump the trigger counter to GUARANTEE the effect above runs
      setIngestTrigger(prev => prev + 1); 
    };
    reader.readAsText(file);
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

  // --- HELPER: Get the object name from formData for label preview ---
  const getObjectLabel = () => {
    // Check for common name field patterns
    const nameValue = formData.name || formData['object.name'] || '';
    if (!nameValue) return null;
    
    // Extract resource type from selectedType
    const resourceType = selectedType?.split('/').pop() || 'resource';
    return `${resourceType}.${normalizeToSnakeCase(nameValue)}`;
  };

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
              <div key={r.typeName} className={`resource-item ${r.typeName === selectedType ? 'active' : ''}`} onClick={() => {
                setPendingFormData(null); 
                setSelectedType(r.typeName);
              }}>
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

            {/* --- NEW: Resource Label Preview for PAN-OS resources --- */}
            {selectedType?.startsWith('panos_') && getObjectLabel() && (
              <div className="label-preview">
                <span className="preview-label">Terraform Resource Label:</span>
                <code className="preview-code">{getObjectLabel()}</code>
                <span className="preview-note">
                  (Object name "{formData.name || formData['object.name']}" preserved as-is in HCL)
                </span>
              </div>
            )}

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