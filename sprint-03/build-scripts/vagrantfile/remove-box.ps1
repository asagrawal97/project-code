vagrant halt
vagrant destroy -f
vagrant box remove db
vagrant box remove frontend
Remove-Item -Verbose ./db/.vagrant -Recurse
Remove-Item -Verbose ./frontend/.vagrant -Recurse

Set-Location -path ../../build/

Remove-Item -Verbose ./*.box
