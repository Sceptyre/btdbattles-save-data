$dir="$((Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Valve\Steam).InstallPath)\userdata\166750487\444640\local\Data\Docs\";Rename-Item "$dir\Profile.save" "$dir\Profile.save.bak" -Force;Iwr "https://raw.githubusercontent.com/Sceptyre/btdbattles-save-data/main/Profile.save" -OutFile "$dirProfile.save"
