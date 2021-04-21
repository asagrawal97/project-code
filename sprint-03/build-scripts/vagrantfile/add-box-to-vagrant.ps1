Set-Location -path ../../build/

vagrant box add ./db-virtualbox*.box --name db
vagrant box add ./frontend-virtualbox*.box --name frontend

Set-Location -path ../build-scripts/vagrantfile
