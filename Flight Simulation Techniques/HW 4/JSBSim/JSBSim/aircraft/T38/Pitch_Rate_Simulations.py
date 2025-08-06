import jsbsim

def run_simulation():
    jsbsim_root = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 4\JSBSim\JSBSim"
    elevator_script = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 4\JSBSim\JSBSim\T38_elevator.xml"

    # Initialize JSBSim
    sim = jsbsim.FGFDMExec(jsbsim_root)
    sim.load_script(elevator_script)
    sim.set_property_value('ic/mach', 0.8) # also adjusted in elevator xml file
    sim.set_property_value('ic/h-agl-ft', 40000) # also adjusted in elevator xml file
    sim.set_property_value('fcs/elevator-cmd-norm', 0.0)  # start at neutral

    # Reset simulation
    sim.run_ic()

    # Simulate for 25 seconds
    dt = 0.02 # also provided in elevator xml file
    time = 0.0

    while time <= 25.0:

        # Step Inputs from Homework Graph - Also under elevator file
        if time >= 5.0:
            sim.set_property_value('fcs/elevator-cmd-norm', -0.1)
        if time >= 9.0:
            sim.set_property_value('fcs/elevator-cmd-norm', 0.1)
        if time >= 13.0:
            sim.set_property_value('fcs/elevator-cmd-norm', 0.0)
        sim.run()
        time += dt
        sim.set_dt(dt)

# Run simulation
run_simulation()
