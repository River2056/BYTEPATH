New-Item -ItemType directory -Path . -Name lib;
Set-Location ./lib;
git clone https://github.com/rxi/classic;
git clone https://github.com/a327ex/boipushy;
git clone https://github.com/vrld/hump.git;
Set-Location ../
