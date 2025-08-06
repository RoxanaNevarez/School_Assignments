import jsbsim
import matplotlib.pyplot as plt
import numpy as np

jsbsim_root = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 3\JSBSim\JSBSim"
trim_script = r"C:\Users\Roxan\OneDrive\UCSD\Spring 2025\MAE 184\HWs\HW 3\JSBSim\JSBSim\c182_trim.xml"

true_airspeeds_kts = np.array([117, 122, 127, 131, 135, 138, 141, 144])
true_airspeeds_fps = true_airspeeds_kts * 1.68781 # converts kts -> ft/s for the sake of initial condition
manufacturer_bhp = [113, 122, 131, 140, 147, 156, 166, 175]

fdm = jsbsim.FGFDMExec(jsbsim_root)
fdm.set_debug_level(0)
fdm.load_script(trim_script)

jsbsim_bhp = []
jsbsim_fuel_flows = []

for v in true_airspeeds_fps:
    fdm['ic/vt-fps'] = v # changed Vt to 197.474 [ft/s] (same as 117 [kts]) as initial value in c182_trim.xml file
    fdm['ic/h-agl-ft'] = 6000 # also adjusted in c182_trim.xml file
    fdm['fcs/mixture-cmd-norm'] = 1.0
    fdm.run_ic()

    fdm['simulation/do_simple_trim'] = 0
    for _ in range(500):
        fdm.run()

    bhp = fdm['propulsion/engine/power-hp']
    fuel_flows = fdm['propulsion/engine/fuel-flow-rate-gph']
    jsbsim_bhp.append(bhp)
    jsbsim_fuel_flows.append(fuel_flows)
print("True Airspeed [kts] | Manufacturer BHP | JSBSim BHP | Fuel Flow Rate")
print("--------------------------------------------------------------------")
for kts, m_bhp, j_bhp, j_ff in zip(true_airspeeds_kts, manufacturer_bhp, jsbsim_bhp, jsbsim_fuel_flows):
    print(f"{kts:>19} | {m_bhp:>17} | {j_bhp:>10.2f} | {j_ff:>10.2f}")

# Plotting
plt.figure(figsize=(7, 7))
plt.plot(true_airspeeds_kts, manufacturer_bhp, label="Manufacturer Data", color='blue', linestyle='-')
plt.scatter(true_airspeeds_kts, jsbsim_bhp, color='red', label="JSBSim Trim Results", zorder=5)
plt.xlabel("True Airspeed [kts, nmi/hr]")
plt.ylabel("Engine Brake Horsepower [hp]")
plt.title("Cessna 182P Cruise Performance [Altitude = 6000 ft]")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig("Problem 3.1 Plot.png", dpi=300)
plt.show()
