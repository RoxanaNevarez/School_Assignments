
import jsbsim

# fdm = jsbsim.FGFDMExec('your folder here')
# linux
# fdm = jsbsim.FGFDMExec('/home/...')
# windows
fdm = jsbsim.FGFDMExec('C:/Users/Roxan/PyCharmMiscProject/JSBSim')

fdm.load_script('c182_trim.xml')

# fdm.load_script('c182_elevator.xml')
# fdm.load_script('T38_trim.xml')

fdm.run_ic()

while fdm.run():
    pass
