
export INSTALL_TENA_USERNAME="username"
export INSTALL_TENA_DIR="development"

echo "Installing TENA Middleware Optimized"
sudo docker run --rm -v /Users/$INSTALL_TENA_USERNAME/Downloads:/home/Downloads -v /Users/$INSTALL_TENA_USERNAME/$INSTALL_TENA_DIR:/home tena:v2xhub /home/Downloads/TENA-MiddlewareSDK-v6.0.8.B@Product@u2004-gcc9-64-va0b09d44.bin -i /home --auto

echo "Installing VUG Combined Distribution OM Optimized"
sudo docker run --rm -v /Users/$INSTALL_TENA_USERNAME/Downloads:/home/Downloads -v /Users/$INSTALL_TENA_USERNAME/$INSTALL_TENA_DIR:/home tena:v2xhub /home/Downloads/VUG-VOICES-Combined-Distribution-v0.12.0@Product@u2004-gcc9-64-v1976e608.bin -i /home --auto

echo "Installing TENA Optimized Boost"
sudo docker run --rm -v /Users/$INSTALL_TENA_USERNAME/Downloads:/home/Downloads -v /Users/$INSTALL_TENA_USERNAME/$INSTALL_TENA_DIR:/home tena:v2xhub /home/Downloads/TENA-boost-v1.77.0.1@Product@u2004-gcc9-64-vall.bin -i /home --auto

echo "Installing TENA Middleware Debug"
sudo docker run --rm -v /Users/$INSTALL_TENA_USERNAME/Downloads:/home/Downloads -v /Users/$INSTALL_TENA_USERNAME/$INSTALL_TENA_DIR:/home tena:v2xhub /home/Downloads/TENA-MiddlewareSDK-v6.0.8.B@Product@u2004-gcc9-64-d-va0b09d44.bin -i /home --auto

echo "Installing VUG Combined Distribution OM Debug"
sudo docker run --rm -v /Users/$INSTALL_TENA_USERNAME/Downloads:/home/Downloads -v /Users/$INSTALL_TENA_USERNAME/$INSTALL_TENA_DIR:/home tena:v2xhub /home/Downloads/VUG-VOICES-Combined-Distribution-v0.12.0@Product@u2004-gcc9-64-d-v1976e608.bin -i /home --auto

echo "Installing TENA Debug Boost"
sudo docker run --rm -v /Users/$INSTALL_TENA_USERNAME/Downloads:/home/Downloads -v /Users/$INSTALL_TENA_USERNAME/$INSTALL_TENA_DIR:/home tena:v2xhub /home/Downloads/TENA-boost-v1.77.0.1@Product@u2004-gcc9-64-d-vall.bin -i /home --auto

unset INSTALL_TENA_USERNAME
unset INSTALL_TENA_DIR
