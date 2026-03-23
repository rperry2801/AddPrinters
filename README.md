# AddPrinters
Add Printers via Windows Powershell and CSV file

If you save the csv and script in different folders, the location of the csv file has to match the filepath in the $printerList string variable on line 5.
Aside from that, do not edit the top row of the csv, and enter every row below with corresponding printer data and run the script.

With the current version of this script, if the printer port already exists, and there is a printer attached to it, it will simply put both printers on that port so you may want to check that before running it.
