<# Change the value of $printerList to the filepath of your CSV with the printer data, the top row of the CSV should be set with
Name,Driver,Portname,sharedname
with that EXACT capitalization feel free to copy line 2 #>

$printerList = "printers.csv"

try {
    # Error handling on file path and data in the file
    if (-not (Test-Path -Path $printerList)) {
        throw "CSV file not found at path: $printerList"
    }

    $printers = Import-Csv -Path $printerList

    if (-not $printers -or $printers.Count -eq 0) {
        throw "CSV file is empty or has no valid rows."
    }

    $currentCopy = 0

    foreach ($printer in $printers) {
        if (-not (Get-PrinterPort -Name $printer.Portname -ErrorAction SilentlyContinue)) {
            Add-PrinterPort -Name $printer.Portname -PrinterHostAddress $printer.Portname
            add-printer -Name $printer.Name -Drivername $printer.Driver -Portname $printer.Portname -Shared -ShareName $printer.sharedname
            Write-Host "Add Printer Command Finished:" $printer.Name
        } else {
            $currentCopy += 1
            $currentCopyString = $currentCopy.ToString()
            $appendPortName = $printer.Portname + "_" + $currentCopyString
            Add-PrinterPort -Name $appendPortName -PrinterHostAddress $printer.Portname
            add-printer -Name $printer.Name -Drivername $printer.Driver -Portname $appendPortName -Shared -ShareName $printer.sharedname
            Write-Host "Add Printer Command Finished:" $printer.Name
        }
    }

} catch {
    Write-Error "Error: $_"
} 
