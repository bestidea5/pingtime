Date: 25.06.2020
Version: 1.0 - 20200625

# Microsoft Windows Ping Time Log Helper (pingtime)

## How to use it
- Simply download the [latest](https://github.com/cohe1337/pingtime/archive/master.zip)  release or clone this repo.
- Extract the folder contained in the zip file.
- Go into pingtime folder and edit pingtime.bat
  - SERVER: 8.8.8.8
  - COUNTER: 5
  - INTERVALINSEC: 10
It mean, you will ping 8.8.8.8 for 5 times but 10 seconds wait between each ping.
- Save it
- Run "pingtime.bat" and wait

## Output
- After running this batchfile, please check same folder for new log file.
  - Name: pingtime-%SERVERIP%.log
  - Headline: C-I ~ COUNTER - INTERVALINSEC
  
## CHANGELOG
- 25.06.2020 - 1.0 - 20200625
  - Release
