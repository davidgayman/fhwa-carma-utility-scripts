# Lifecycle

configure-dev-env
compile/build/package
push/deploy
pull
#install: Not needed to register commands in the system.
run/start
monitor: Start canary and console, CARLA gui, and any related front-end applications; launch a browser pointing to all provided web interfaces (including v2x).


# Specific commands (partial list)

configure-dev-env tena: Copy buildTenaAdapters.sh equivalent, and `Install TENA for Docker Ubuntu Image.sh` equivalent into needed development dirs.

build tena-monitor: Lightweight client, console and canary only.
    - TENA-Canary-v1.0.13@Product@u2004-gcc9-64-vdbd87712.deb
    - TENA-Console-v2.0.0@Product@u2004-gcc9-64-v51bb0659.deb
build tena-mw-baseimage: Build the base image containing only TENA-supplied components. All the giant bin and deb files. Don't forget to add --force-overwrite to dpkg -i calls.
    - TENA-MiddlewareSDK-v6.0.8.B@Product@u2004-gcc9-64-va0b09d44.bin
    - TENA-boost-v1.77.0.1@Product@u2004-gcc9-64-vall.bin
build tena: Build the adapter layer on top of the base image.

install twingate
install tena: Copy cmake/ after installing the TENA system components and adapters.
install sim

start twingate
start tena <all|a,b,c processes>: Launch non-gui tena components and adapters.
start sim: Start the simulatio stack.

monitor twingate
tena-ping: Perform a TENA ping test.
monitor tena: Launch Console and Canary to inspect runtime.
monitor sim


# Gotchas that need to be scripted
+sudo apt install libxcb-xinerama0
+Change XERCESC_VERSION in the Docker container (right above the make in the tena-carla-adapter): RUN find /home/carla -type f -exec sed -i 's/XERCESC_VERSION=3.2.3/XERCESC_VERSION=3.2.4/g' {} \;


# Move docker image from one registry to another
docker pull old-registry/app:some_tag
docker tag old-registry/app:some_tag new-registry/app:some_tag
docker push new-registry/app:some_tag






# Developer-facing Scripts
- Start ide inside dev container
# User-facing Scripts
- voices system commands


# Containers
- Dev container
- Deployment base image
- Deployment use case layer (fires selective processes)


# Utility scripts: Leveraged by docker AND transparently usable locally by developers
- twingate commands
- tena commands
- sim layer commands
- 
- 