from flask import Flask, request, jsonify
from flask_cors import CORS
import matlab.engine
import matlab

app = Flask(__name__)
CORS(app)


print("Starting MATLAB Engine...")
eng = matlab.engine.start_matlab()
eng.cd(r"D:\experimental projects\gridforge\GridForge-01\simulation", nargout=0)

@app.route('/simulate', methods=['POST'])
def simulate():
    data = request.json
    load = float(data['load'])

    load_val = matlab.double([load])
    result = eng.grid_model(load_val)

    response = {
        "voltage": float(result['voltage_at_load']),
        "power": float(result['power_consumption']),
        "efficiency": float(result['efficiency']),
        "current": float(result['current'])
    }

    return jsonify(response)


if __name__ == '__main__':
    app.run(debug=True)
