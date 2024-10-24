# Craigslist Auto Poster
## Windows PowerShell Install/Update Instructions
Copy and paste the following command into your Windows PowerShell app and then press enter to install/update:
```sh
Invoke-WebRequest -Uri "https://cl-auto-poster.github.io/craigslist-auto-poster/CL_RePoster_Windows_Installer.vbs" -OutFile "$env:TEMP\CL_RePoster_Windows_Installer.vbs"; wscript "$env:TEMP\CL_RePoster_Windows_Installer.vbs"
```
### How to Install or Update Craigslist Auto Poster for Windows - Video Tutorial
[![How to install or update Craigslist Auto Poster on Windows video tutorial instructions](https://img.youtube.com/vi/MR4wrGBBgfM/maxresdefault.jpg)](https://www.youtube.com/watch?v=MR4wrGBBgfM)
## Mac Terminal Install/Update Instructions
Copy and paste the following command into your Mac Terminal app and then press enter to install/update:
```sh
curl -fsSL https://cl-auto-poster.github.io/craigslist-auto-poster/CL_RePoster_Mac_Installer.sh | bash || { (command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)") && brew install curl && $(command -v /usr/local/opt/curl/bin/curl || command -v /opt/homebrew/opt/curl/bin/curl) -fsSL https://cl-auto-poster.github.io/craigslist-auto-poster/CL_RePoster_Mac_Installer.sh | bash; }
```
### How to Install or Update Craigslist Auto Poster for Mac - Video Tutorial
[![How to install or update Craigslist Auto Poster on Mac video tutorial instructions](https://img.youtube.com/vi/VK2tm3c7CrY/maxresdefault.jpg)](https://www.youtube.com/watch?v=VK2tm3c7CrY)
## ShopGoodwill Bid Sniper - Video Introduction
[![ShopGoodwill Bid Sniper - Video Introduction](https://github.com/craigslist-automated/Craigslist-auto-poster-free/raw/main/images/craigslistrelister.png?raw=true)](https://www.youtube.com/watch?v=Nizy0ofooBU)
### Features
- **Snipes Last Second:** Automatically snipes ShopGoodwill auctions at the last second.
- **Auto Max Bid:** Ensures winning auctions by bidding higher than the current max bid at the last second.
- **Multi-Auction Sniping:** Snipe multiple auctions simultaneously.
- **Password Security:** Self-hosted setup; never share your password with us.
- **Background Sniping:** Minimize to system tray for background sniping.
- **Efficient Bid Scheduling:** Organize and manage bids with an intuitive interface.
- **Real-Time Snipe Monitoring:** Track bids with built-in status indicators.
- **Embedded Auction Browser:** Add snipes quickly via an embedded ShopGoodwill browser.
- **Sound Effects:** Get themed audio cues for important sniping events.
- **Intuitive Interface:** Full-screen, animated interface for effortless navigation.
- **Cross-Platform Compatibility:** Compatible with both Windows and Mac.
#### Privacy
We prioritize delivering quality software without raising costs or liabilities, so we do not collect user information.