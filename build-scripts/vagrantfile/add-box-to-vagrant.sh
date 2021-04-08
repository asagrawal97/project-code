
cd ../../build/

vagrant box add ./db-virtualbox*.box --name db
vagrant box add ./frontend-virtualbox*.box --name frontend

cd ../build-scripts/vagrantfile
