$steamdir=(@('HKLM:\SOFTWARE\Wow6432Node\Valve\Steam','HKLM:\SOFTWARE\Valve\Steam') | Select -First 1 | ? {Test-Path $_} | Get-ItemPropertyValue -Name InstallPath);
Write-Host "Located Steam Directory: $steamdir";

$users = @(gci "$steamdir\userdata" -Name -Directory)

if($users.length -gt 1){
  Write-Host "Multiple Users Found:"
  $indexes = (0..($users.length - 1))
  
  while($true) {
    $indexes | % {
      Write-Host "$_ - $($users[$_])"
    }
    $opt = Read-Host "Please Select User to Update Save For: "
    if ($indexes.Contains($opt)) {
      $user = $users[$opt]
      break;
    } else {
      Write-Host "Invalid Option"
    }
  }  
} elseif($users.length -eq 1) {
  Write-Host "Found Following User:"
  Write-Host $users[0]
  
  $user = $users[0]
} else {
  throw "No User Data Found"
}

$dir = "$steamdir\userdata\$user\444640\local\Data\Docs"
Write-Host "Updating Save Data In: $dir"

Write-Host "Renaming Old Profile.save";
Move-Item -Path "$dir\Profile.save" -Destination "$dir\Profile.save.bak" -Force;

Write-Host "Downloading New Profile.save";
Iwr "https://raw.githubusercontent.com/Sceptyre/btdbattles-save-data/main/Profile.save" -OutFile "$dir\Profile.save";

Write-Host "Save Data Updated!";
