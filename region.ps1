#variables
$regionalsettingsURL = "https://github.com/Anon212212/ServerBuild/blob/main/IE.XML"
$RegionalSettings = "D:\IE.xml"


#downdload regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)


# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages/culture. Not needed perse.
Set-WinSystemLocale en-IE
Set-WinUserLanguageList -LanguageList en-IE -Force
Set-Culture -CultureInfo en-IE
Set-WinHomeLocation -GeoId 68
Set-TimeZone -Name "GMT Standard Time"

# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
Start-sleep -Seconds 40
Restart-Computer
