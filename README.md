# GridForge — Web-Based Power System Simulator

A full-stack engineering simulation platform where MATLAB acts as the numerical engine, Python controls computation, and a modern web interface provides real-time visualization.

---

## 🧠 Overview

GridForge is a web-controlled electrical simulation platform built with:

- **MATLAB** — Simulation & numerical computation engine  
- **Python (Flask)** — Backend control & API server  
- **React (Vite)** — Interactive frontend dashboard  

**Architecture:**


Browser UI → Python API → MATLAB Engine → Electrical Simulation → Results → Browser UI


---

### ⚡ **Section 1 — Simulation & Structure**

## ⚡ Current Simulation Model

The first model simulates a simple electrical power delivery system:

```

Power Source → Transmission Line → Electrical Load

```

The user controls **load demand** from the browser and MATLAB computes in real time:

- Line current  
- Voltage drop  
- Voltage at load  
- Power delivered  
- System efficiency  

---

## 🧱 Project Structure


<pre>
gridforge/
│
├── simulation/    # MATLAB models
├── backend/       # Python + MATLAB Engine API
└── frontend/      # React (Vite) web interface
</pre>

---

### 🛠️ **Section 2 — Setup**

## 🛠️ Prerequisites

- **MATLAB 2023a or newer** (with license)
- **Python 3.10** (required for MATLAB Engine)
- **Node.js 18+**
- Windows (tested)

---

## 🔧 Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone <your-repo-url>
cd gridforge
```

---

### 2️⃣ MATLAB Simulation Setup

Open MATLAB and set working directory to:

```
/simulation
```

Test simulation:

```matlab
out = grid_model(500)
```


### 🔧 **Section 3 — Backend & Frontend**


### 3️⃣ Backend Setup

```
cd backend
py -3.10 -m venv venv
venv\Scripts\activate
pip install flask flask-cors
````

Enable MATLAB Engine:

```bash
cd "C:\Program Files\MATLAB\R2023a\extern\engines\python"
python setup.py install
```

Run backend:

```bash
cd GridForge-01/backend
python app.py
```

Server runs at:
`http://127.0.0.1:5000`

---

### 4️⃣ Frontend Setup

```bash
cd frontend
npm install
npm run dev
```

Open browser:
`http://localhost:5173`


### 🧪 **Section 5 — Usage & Closing**


## 🧪 Using the Simulator

1. Adjust **Load Demand** slider  
2. Click **Run Simulation**  
3. View real-time electrical results calculated by MATLAB  

---

## 🧭 Roadmap

- Live plotting & trends  
- Multi-load & microgrid models  
- Renewable energy integration  
- Fault & stability analysis  
- AI-based control systems  

---

## 🧠 Why GridForge

This platform demonstrates how classical engineering simulation tools can be transformed into modern interactive systems used in:

- Smart grids  
- Digital twins  
- Energy optimization  
- Research & development  

by [RSMK](https://its.rsmk.me)

---



