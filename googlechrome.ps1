$LocalTempDir = $env:TEMP
$ChromeInstaller = "chrome_installer.exe"
$TLS12Protocol = [System.Net.SecurityProtocolType] 'Ssl3 , Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $TLS12Protocol
(new-object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller")
Start-Process -FilePath "$LocalTempDir\$ChromeInstaller" -Args '/silent /install' -Verb RunAs -Wait
Remove-Item -Path "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose
