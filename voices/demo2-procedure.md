# Legacy instructions: https://usdot-voices.atlassian.net/wiki/spaces/VCPWG/pages/1426161665/VOICES+Constructive+Node+Setup

# CARMA Platform Image
docker pull usdotfhwastolcandidate/carma-config:voices-constructed-follower
carma config set usdotfhwastolcandidate/carma-config:voices-constructed-follower
carma config install usdotfhwastolcandidate/carma-config:voices-constructed-follower
cd ~/carma_ws/src/carma-platform
git checkout feature/voices-follower-params
carma start all

# CARMA-CARLA integration image

docker pull usdotfhwastol/carma-carla-integration:latest

# Run CARMA Sim
cd ~/voices-poc/scripts/run_scripts/demo1/constructive_node
./runCarmaSim.sh
cd ~/voices-poc/scripts/carla_python_scripts
python3 set_time_mode.py

# Adapters
Build each adapter
Push to binary repository
Build the adapter image, which pulls all adapters from the binary repository
Run the contiainer

## Legacy helper script
cd ~/voices-poc/scripts/run_scripts/demo1/constructive_node
./runCarlaAdapter.sh
cd ~/voices-poc/scripts/run_scripts/demo1/constructive_node
./runCarmaPlatformAdapter.sh
