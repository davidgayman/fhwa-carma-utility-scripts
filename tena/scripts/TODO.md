# Layers
- voices: Shell into the Network/integration/connection stack
  - Network (basic ping tests and getting ip etc.)
  - VPN: Twingate
  - Messaging/MW: TENA (groups=EM, monitors, adapters)
- carma: Shell into the carma stack: CARMA Solution: CARMA Sim


# Containers: Also enable passthrough builds
- voices
    - Dockerfile-network-base    base image (`FROM UBUNTU`)
    - Dockerfile-network-tools   voices-network: Adds network-tools
    - Dockerfile-network-vpn     voices-vpn
    - Dockerfile-network-mw-framework   tena-mw
    - Dockerfile-network-mw-monitor     tena-monitor
    - Dockerfile-network-mw-adapters    tena-adapters
- sim
    - Dockerfile-sim-base: Base image (`FROM UBUNTU`)
    - sim demo-2-siteA
    - sim demo-2-siteB
    - sim demo-2-siteC


# container management scripts lifecycles
- build
- push
- pull
- install
- run
- stop


# Script subcommand lifecycles
- configure-dev-env
- compile/build/package
- push/deploy
- pull
- #install: Not needed to register commands in the system.
- run/start
- monitor: Start canary and console, CARLA gui, and any related front-end applications; launch a browser pointing to all provided web interfaces (including v2x).



# Scripts
- container management scripts: Build, install, and run the containers. Docker container lifecycle commands are provided by each, including a `start-dev-ide`.
  - voices
  - voices-carma
- process management (utility scripts): Called inside the container to do process management (including build and install the process). Each script provides the full lifecycle sub-commands. Leveraged by docker AND transparently usable locally by developers. Utilize Supervisor and call these scripts from Dockerfiles and make them available to the command line via path in docker.
  - net, vpn, mw, carma


# Scripted Components
## Container Management Components
- voices
- voices-carma

## Process Management Components
- net
  - <all=there are no specific components>
- vpn
  - connector
  - client: A separate client component enables outsiders to VPN in to the network.
- mw
  - em
  - monitoring-tools
  - adapters
    - <...each adapter name...>
- carma
  - carla
  - sumo
  - carma-platform
  - carma-streets


# Sample commands
voices mw em run



# Script subcommand mapping
- voices or voices-connector <command>
  - <default command=sh or bash> Shell into the network layer (network+vpn+messaging) container.
    - net: Net commands
        - <lifecycle commands>
    - vpn: VPN commands
        - <lifecycle commands>
    - mw-monitor: Middleware/messaging commands
        - <lifecycle commands=build, install, run, stop>
    - mw-adapters: Middleware/messaging commands
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


# Adavnced features
- TK component status dashboard
- NX or Python or Ruby implementation

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


## Move docker image from one registry to another
docker pull old-registry/app:some_tag
docker tag old-registry/app:some_tag new-registry/app:some_tag
docker push new-registry/app:some_tag
