# Lifecycle

configure-dev-env
compile/build/package
push/deploy
pull
#install: Not needed to register commands in the system.
run/start
monitor: Start canary and console, CARLA gui, and any related front-end applications; launch a browser pointing to all provided web interfaces (including v2x).


# Layers
- voices: Shell into the Network/integration/connection stack
  - Network (basic ping tests and getting ip etc.)
  - VPN: Twingate
  - Messaging/MW: TENA (groups=EM, monitors, adapters)
- carma: Shell into the carma stack: CARMA Solution: CARMA Sim






# Developer-facing Scripts
- Start ide inside dev container
# User-facing Scripts
- voices system commands


- container management scripts: Build, install, and run the containers.
  - voices
  - voices-carma
- utility scripts: Called inside the container to do process management (including build and install the process).
  - net, vpn, mw, carma

# Containers: Also enable passthrough builds
- voices base image
- voices-network: with network-tools
- voices-vpn
- tena-mw-baseimage
- tena-monitor
- tena-adapters
- sim baseimage
- sim demo-2-siteA
- sim demo-2-siteB
- sim demo-2-siteC

- Dev container (from tena-mw-baseimage with twingate with network-tools)
- Deployment base image
- Deployment use case layer (fires selective processes)



# Utility scripts: Leveraged by docker AND transparently usable locally by developers. Utilize Supervisor and call these scripts from Dockerfiles and make them available to the command line via path in docker.
- twingate commands
- tena commands
- sim layer commands
-









# Scripts
- voices or voices-connector <command>
  - <default command=sh or bash> Shell into the network layer (network+vpn+messaging) container.
    - net: Net commands
        - <lifecycle commands>
    - vpn: VPN commands
        - <lifecycle commands>
    - mw: Middleware/messaging commands
        - <lifecycle commands=build, install, run, stop>
  - build: Build the voices image.
  - run: Run the voices image.
  - install: Install the container as a servce.
  - start-dev-ide: Start the container and launch an IDE.
- voices-carma
  - build: Build the carma image.
  - run: Run the carma image.
  - install: Install the container as a servce.
  - start-dev-ide: Start the container and launch an IDE.
  - <default command=sh>
    - carma: Manage carma processes.
        - [all] <group lifecycle commands refer to component `all`>
        - <component> <lifecycle command>



# Specific commands (partial list)

## (developer-facing)
configure-dev-env tena: Copy buildTenaAdapters.sh equivalent, and `Install TENA for Docker Ubuntu Image.sh` equivalent into needed development dirs.

build tena-monitor: Lightweight client, console and canary only.
    - TENA-Canary-v1.0.13@Product@u2004-gcc9-64-vdbd87712.deb
    - TENA-Console-v2.0.0@Product@u2004-gcc9-64-v51bb0659.deb
build tena-mw-baseimage: Build the base image containing only TENA-supplied components. All the giant bin and deb files. Don't forget to add --force-overwrite to dpkg -i calls.
    - TENA-MiddlewareSDK-v6.0.8.B@Product@u2004-gcc9-64-va0b09d44.bin
    - TENA-boost-v1.77.0.1@Product@u2004-gcc9-64-vall.bin
build tena: Build the adapter layer on top of the base image.


## (user-facing)
twingate install <component>
tena install <component>: Copy cmake/ after installing the TENA system components and adapters.
sim install <component>

twingate start <component>
tena start <component=all|a,b,c processes>: Launch non-gui tena components and adapters.
sim start <component>: Start the simulatio stack.

twingate monitor <component>
tena-ping=twingate monitor <console+canary>: Perform a TENA ping test.
tena monitor <component>: Launch Console and Canary to inspect runtime.
sim monitor <component>


# Gotchas that need to be scripted
+sudo apt install libxcb-xinerama0
+Change XERCESC_VERSION in the Docker container (right above the make in the tena-carla-adapter): RUN find /home/carla -type f -exec sed -i 's/XERCESC_VERSION=3.2.3/XERCESC_VERSION=3.2.4/g' {} \;


# Move docker image from one registry to another
docker pull old-registry/app:some_tag
docker tag old-registry/app:some_tag new-registry/app:some_tag
docker push new-registry/app:some_tag




