import { useState } from "react";
import "./App.css";

function App() {
  const [load, setLoad] = useState(500);
  const [data, setData] = useState(null);

  const runSimulation = async () => {
    const response = await fetch("http://127.0.0.1:5000/simulate", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ load: Number(load) })
    });

    const result = await response.json();
    setData(result);
  };

  return (
    <div className="container">
      <h1>GridForge Simulator</h1>

      <label>Load Demand</label>
      <input
        type="range"
        min="100"
        max="1000"
        value={load}
        onChange={(e) => setLoad(e.target.value)}
      />
      <p>{load} W</p>

      <button onClick={runSimulation}>Run Simulation</button>

      {data && (
        <div className="results">
          <p>Voltage: {data.voltage.toFixed(2)} V</p>
          <p>Power: {data.power.toFixed(2)} W</p>
          <p>Efficiency: {data.efficiency.toFixed(2)} %</p>
          <p>Current: {data.current.toFixed(2)} A</p>
        </div>
      )}
    </div>
  );
}

export default App;
