#!/bin/bash

# Build the C++ application
cd appWebServerqt 
cmake
make

# Start the Python server
cd ..
python3 server.py &
SERVER_PID=$!

# Run the C++ application
./appWebServerqt

# Cleanup the App
kill $SERVER_PID
