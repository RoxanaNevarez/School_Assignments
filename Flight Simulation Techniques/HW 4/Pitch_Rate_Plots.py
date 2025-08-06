import matplotlib.pyplot as plt
import jsbsim
import numpy as np


def run_simulation(sas_enabled):
    # Set gain manually in the XML or simulate it here
    # (We assume the XML is pre-modified per run, as instructed in the screenshot)
    jsbsim_root = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 4\JSBSim\JSBSim"
    elevator_script = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 4\JSBSim\JSBSim\T38_elevator.xml"
    # Initialize JSBSim
    sim = jsbsim.FGFDMExec(jsbsim_root)  # adjust path
    sim.load_script(elevator_script)  # load aircraft model
    sim.set_property_value('ic/mach', 0.8)
    sim.set_property_value('ic/h-agl-ft', 40000)
    sim.set_property_value('fcs/elevator-cmd-norm', 0.0)  # start at neutral

    # Reset simulation
    sim.run_ic()

    # Simulate for 25 seconds
    dt = 0.01
    sim_time = []
    pitch_rate = []

    time = 0.0
    while time <= 25.0:
        # Record time and pitch rate (deg/s)
        sim_time.append(time)
        q_rad_s = sim.get_property_value('velocities/q-rad_sec')
        pitch_rate.append(np.degrees(q_rad_s))

        # Apply elevator command (step input)
        if time >= 1.0:
            sim.set_property_value('fcs/elevator-cmd-norm', 0.1)  # step input

        sim.run()
        time += dt
        sim.set_dt(dt)

    return sim_time, pitch_rate


# Run both simulations
time_sas, pitch_rate_sas = run_simulation(sas_enabled=True)
time_no_sas, pitch_rate_no_sas = run_simulation(sas_enabled=False)

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(time_sas, pitch_rate_sas, label='SAS Enabled')
plt.plot(time_no_sas, pitch_rate_no_sas, label='SAS Disabled')
plt.xlabel('Time (sec)')
plt.ylabel('Pitch Rate (deg/sec)')
plt.title('Pitch Rate Response with/without SAS')
plt.legend()
plt.grid(True)
plt.savefig('pitch_response.png', dpi=300)
plt.show()
