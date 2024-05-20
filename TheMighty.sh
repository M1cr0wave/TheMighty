#!/bin/bash
## Made By Nikhil Kanade
echo "Pulling the ClamAV Docker image... 🚀"
docker pull clamav/clamav

echo "Running the ClamAV Docker container... 🏃💨"
docker run -d -p 3310:3310 clamav/clamav

echo "Cloning the ClamAV REST API repository... 🍿"
git clone https://github.com/benzino77/clamav-rest-api.git

cd clamav-rest-api

echo "Please run 'ifconfig/ipconfig' 😁 and enter your Machine IP 🛜: An Example is 192.168.10.35"
read CONTAINER_IP

echo "Running the ClamAV REST API 💤 Docker 💤 container... 💤 "
docker run -d -p 8080:8080 \
-e NODE_ENV=production \
-e APP_PORT=8080 \
-e APP_FORM_KEY=FILES \
-e CLAMD_IP=$CONTAINER_IP \
-e APP_MAX_FILE_SIZE=26214400 \
benzino77/clamav-rest-api

echo "Please enter the sample file path: (absolute path 🤩)"
read FILE_PATH

echo "Sending a POST request to the ClamAV REST API..."
echo -e "\n"
echo "Using the Command... remember to copy it 😘"
echo -e "\n"
echo "curl -X POST -F "FILES=@$FILE_PATH" http://localhost:8080/api/v1/scan
"
curl -X POST -F "FILES=@$FILE_PATH" http://localhost:8080/api/v1/scan
## Made By Nikhil Kanade