# Define the directory where the files are expected
$directoryPath = "C:\Path\To\Your\Files"

# Get today's date in YYYYMMDD format
$todayDate = Get-Date -Format "yyyyMMdd"

# Define the common part of file names (Modify as per your pattern)
$commonFileNames = @(
    "file", "report", "log", "data", "backup",
    "summary", "record", "details", "error", "transaction",
    "export", "import", "process", "status", "archive",
    "audit", "event", "metric", "analytics", "summarylog"
)

# Generate the expected file names dynamically (Adding date suffix)
$expectedFiles = $commonFileNames | ForEach-Object { "$_`_$todayDate.txt" }

# Initialize missing files list
$missingFiles = @()

# Check if each expected file is present
foreach ($file in $expectedFiles) {
    $filePath = Join-Path -Path $directoryPath -ChildPath $file
    if (!(Test-Path $filePath)) {
        $missingFiles += $file  # Add missing file to list
    }
}

# Generate log file
$logFile = "C:\Path\To\Your\Logs\FileCheckLog_$todayDate.txt"
if ($missingFiles.Count -eq 0) {
    "[$todayDate] All files are present." | Out-File -FilePath $logFile -Append
} else {
    "[$todayDate] Missing Files: $($missingFiles -join ', ')" | Out-File -FilePath $logFile -Append
}

Write-Output "File check completed. Log saved at $logFile"
