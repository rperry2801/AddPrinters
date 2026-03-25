# AddPrinters
Add Printers via Windows Powershell and CSV file

If you save the csv and script in different folders, the location of the csv file has to match the filepath in the $printerList string variable on line 5.
Aside from that, do not edit the top row of the csv, and enter every row below with corresponding printer data and run the script.

There is a weird port naming scheme this script uses to continue running if the IP ports are already created, so it is recommended to delete the ports you plan on installing to ahead of time in the control panel if you can before running the script.
