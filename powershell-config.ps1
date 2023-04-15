$Processes = "$PROFILE.CurrentUserAllHosts"

# creates a powershell profile if it does not exists at
# C:\Users\$your-username\Documents\WindowsPowerShell
if (!(Test-Path -Path "$Processes")) {
  New-Item -ItemType File -Path "$Processes" -Force
}


function Append-Config {
  param (
    $Config
  )
  "$Config" >> "$Processes"
}

function Append-New-Line {
  Append-Config -Config ""
}

Append-Config -Config "# Shows navigable menu of all options when hitting Tab"
Append-Config -Config "Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete"

Append-New-Line

Append-Config -Config "# Autocompletion for arrow keys"
Append-Config -Config "Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward"
Append-Config -Config "Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward"

Append-New-Line

Append-Config -Config "# Disable fucking annoying sound on clicking backspace"
Append-Config -Config "Set-PSReadlineOption -BellStyle None"
