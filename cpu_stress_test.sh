sudo apt update -y #update packages
sudo apt install stress -y     #install stress tool
stress --cpu 4 --timeout 300 # Run stress test for 5 minutes