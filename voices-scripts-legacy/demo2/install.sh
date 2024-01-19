Start the EM:
<source first!>
sudo ~/TENA/executionManager-v6.0.8.2/start.sh -listenEndpoints 127.0.0.1:55100 -allowArbitraryValue -multicastProperties 225.25.2.1:55200:64 -allowImplementationMismatch

Start console:
<source first!>
tenaConsole-v1.0.27/start.sh

sudo -E docker build --force-rm --rm -f /home/carma/tenadev/carla-tena-adapter/docker/Dockerfile -t tena:carla .

start-em() {
      sudo ~/TENA/executionManager-v6.0.8.2/start.sh -listenEndpoints 127.0.0.1:55100 -allowArbitraryValue -multicastProperties 225.25.2.1:55200:64 -allowImplementationMismatch
}

run-tena-test() {

  if (local) {
    # Start console
    /opt/TENA/Console-v2.0.0/start.sh

    # Start test application
    /opt/TENA/tenaCanary-v1.0.13/start.sh

  } else if (remote) {
    ssh -X carma@192.168.5.64 /opt/TENA/Console-v2.0.0/start.sh
    ssh -X carma@192.168.5.64 /opt/TENA/tenaCanary-v1.0.13/start.sh
  }
}
