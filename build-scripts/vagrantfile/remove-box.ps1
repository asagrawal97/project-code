vagrant halt
vagrant destroy -f
vagrant box remove db
vagrant box remove frontend
Remove-Item -Verbose ./.vagrant -Recurse

Set-Location -path ../../build/

Remove-Item -Verbose ./*.box

Set-Location -path ../build-scripts/vagrantfile