function result = grid_model(load_demand)
    % GridForge Simulation Model
    % Inputs: load_demand (double) - Requested Load in kW
    % Outputs: result (struct) - Contains V, P, Efficiency

    % System Constants
    V_source = 230; % Volts
    R_line = 0.1;   % Ohms (Keep it small for efficiency)

    % avoid divide by zero or negative logic for simple sim
    if load_demand < 0
        load_demand = 0;
    end

    % Calculate Current (I = P / V approximation, iterating for better accuracy or simple approx)
    % Simple approx: I = P_load / V_source (assuming constant power load at source voltage? No, usually P is consumed by load)
    % Let's model it as a resistive load for simplicity tailored to the power demand
    % If Demand is P in kW.
    % I = (P * 1000) / V_source; (Nominal current)
    
    current = (load_demand * 1000) / V_source;

    % Calculate Voltage Drop on line
    v_drop = current * R_line;

    % voltage at load
    v_load = V_source - v_drop;

    % Total Power taken from source
    p_total_watts = V_source * current;
    
    % Power delivered to load (approximate, if we assume constant current source behavior for demand)
    % Or if we model load as resistance R_load derived from demand:
    % R_load = V_source^2 / P_demand.
    % Then Total R = R_line + R_load.
    % I = V_source / Total R.
    % This is more physically accurate for a connected system.
    
    % Let's use the physical resistance model for realism.
    if load_demand > 0
        R_load = (V_source^2) / (load_demand * 1000);
        
        % Total Circuit Resistance
        R_total = R_line + R_load;
        
        % Actual flow current
        current_actual = V_source / R_total;
        
        % Actual voltage at load
        v_load_actual = current_actual * R_load;
        v_drop_actual = current_actual * R_line;
        
        % p_load_actual = current_actual * v_load_actual;
        p_source_actual = V_source * current_actual;
        
        eff = (v_load_actual / V_source) * 100;
        
    else
        current_actual = 0;
        v_load_actual = V_source;
        v_drop_actual = 0;
        p_source_actual = 0;
        eff = 100;
    end


    % Prepare output structure
    result.voltage_drop = v_drop_actual;
    result.voltage_at_load = v_load_actual;
    result.power_consumption = p_source_actual / 1000; % kW (Source power)
    result.efficiency = eff;
    result.current = current_actual;
end
