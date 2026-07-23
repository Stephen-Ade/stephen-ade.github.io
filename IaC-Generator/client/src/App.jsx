import { useState, useEffect } from 'react';
import axios from 'axios';
import Editor from '@monaco-editor/react';
import './App.css';

function App() {
  const [resources, setResources] = useState([]);
  const [selectedType, setSelectedType] = useState(null);
  const [schema, setSchema] = useState(null);
  const [formData, setFormData] = useState({});
  const [platform, setPlatform] = useState('terraform');
  const [generatedCode, setGeneratedCode] = useState('// Select a resource and click Generate');
  const [loading, setLoading] = useState(false);

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

  const handleGenerate = async (e) => {
    e.preventDefault();
    if (!selectedType) return;
    setLoading(true);
    const cleanConfig = Object.fromEntries(Object.entries(formData).filter(([_, v]) => v !== '' && v !== null));
    try {
      const res = await axios.post('http://localhost:3001/api/generate', { typeName: selectedType, platform, config: cleanConfig });
      setGeneratedCode(res.data.code);
    } catch (err) {
      setGeneratedCode(`// Error`);
    }
    setLoading(false);
  };

  const getLanguage = () => {
    const map = { terraform: 'hcl', bicep: 'bicep', 'cdk-python': 'python', cloudformation: 'json' };
    return map[platform] || 'plaintext';
  };

  const platforms = schema?.supportedPlatforms || (schema?.provider === 'aws' ? ['terraform', 'cdk-python', 'cloudformation'] : ['terraform', 'bicep']);

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
            const displayName = r.deviceType || (parts.length > 2 ? `${parts[parts.length-2]} / ${parts[parts.length-1]}` : parts[parts.length-1]);
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
            <div className="platform-selector">
              {platforms.map(p => (
                <button key={p} onClick={() => setPlatform(p)} className={platform === p ? 'active' : ''}>{p}</button>
              ))}
            </div>
            <form onSubmit={handleGenerate} className="dynamic-form">
              {Object.entries(schema.properties).slice(0, 20).map(([key, prop]) => (
                <div key={key} className="form-group">
                  <label>{key} {schema.required.includes(key) && <span className="req">*</span>}</label>
                  <input type="text" placeholder={`(${prop.type})`} value={formData[key] || ''} onChange={(e) => setFormData({ ...formData, [key]: e.target.value })} />
                </div>
              ))}
              <button type="submit" disabled={loading}>{loading ? 'Generating...' : 'Generate Code'}</button>
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