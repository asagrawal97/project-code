vagrant halt
vagrant destroy -f
vagrant box remove db
vagrant box remove frontend
rm -rf ./.vagrant
rm ../../build/*.box

cd ../build-scripts/vagrantfile
