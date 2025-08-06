import csv
import jsbsim
import numpy as np


def run_simulation_with_sas():
    jsbsim_root = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 4\JSBSim\JSBSim"
    elevator_script = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 4\JSBSim\JSBSim\T38_elevator.xml"

    # Initialize JSBSim
    sim = jsbsim.FGFDMExec(jsbsim_root)
    sim.load_script(elevator_script)
    sim.set_property_value('ic/mach', 0.8)
    sim.set_property_value('ic/h-agl-ft', 40000)
    sim.set_property_value('fcs/elevator-cmd-norm', 0.0)  # start at neutral

    # Reset simulation
    sim.run_ic()

    # Simulate for 25 seconds
    dt = 0.01
    time = 0.0
    data = []

    while time <= 25.0:
        # Record time and pitch rate (deg/s)
        q_rad_s = sim.get_property_value('velocities/q-rad_sec')
        pitch_rate_deg_s = np.degrees(q_rad_s)
        data.append([time, pitch_rate_deg_s])

        # Apply elevator command (step input)
        if time >= 1.0:
            sim.set_property_value('fcs/elevator-cmd-norm', 0.1)

        sim.run()
        time += dt
        sim.set_dt(dt)

    # Write results to CSV
    output_csv = 'pitch_response_sas_off.csv'
    with open(output_csv, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['Time (sec)', 'Pitch Rate (deg/sec)'])
        writer.writerows(data)

    print(f"Data saved to {output_csv}")


# Run the simulation with SAS enabled
run_simulation_with_sas()
