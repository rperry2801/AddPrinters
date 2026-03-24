# AddPrinters
Add Printers via Windows Powershell and CSV file

If you save the csv and script in different folders, the location of the csv file has to match the filepath in the $printerList string variable on line 5.
Aside from that, do not edit the top row of the csv, and enter every row below with corresponding printer data and run the script.

With the current version of this script, if the printer port already exists, and there is a printer attached to it, it will create a duplicate port but the way it appends numbers to it isn't like how windows does it, it will make the first duplicate port titled with _1 for .85 for example, and then if it has to make another duplicate, it will append _2 even though _1 doesn't exist, currently looking into this.
