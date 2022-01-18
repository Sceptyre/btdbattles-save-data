$dir=(@('HKLM:\SOFTWARE\Wow6432Node\Valve\Steam','HKLM:\SOFTWARE\Valve\Steam') | Select -First 1 | ? {Test-Path $_} | Get-ItemPropertyValue -Name InstallPath) + "\userdata\166750487\444640\local\Data\Docs";
Move-Item -Path "$dir\Profile.save" -Destination "$dir\Profile.save.bak" -Force;
Iwr "https://raw.githubusercontent.com/Sceptyre/btdbattles-save-data/main/Profile.save" -OutFile "$dir\Profile.save"
