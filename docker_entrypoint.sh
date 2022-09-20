#!/bin/bash

set -a

# Display current installed version and help
echo "Balance of Satoshis - Version: "
bos --version
echo "Configuring Balance of Satoshis..."
mkdir -p /root/.bos/embassy
chmod -R a+x /root/.bos
mv /credentials.json /root/.bos/embassy/credentials.json
chmod a+x /root/.bos/embassy/credentials.json

echo "Checking for peers..."

# Starting command line
while true;
do bos peers;
sleep 20000;
done

