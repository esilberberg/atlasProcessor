Write-Host "~*~ RENAME FROM CSV ~*~" -ForegroundColor Green
Write-Host "Files in directory that are not listed in the CSV are not renamed." -ForegroundColor Green
$path = Read-Host -Prompt "Please copy and paste the video directory path"

Write-Host "The CSV file must have a column BaseName that indicates the current file name and a column NewName that indicates the desired file name." -ForegroundColor Green
$csv = Read-Host -Prompt "Drag and drop CSV file and remove any quotes around file path"

$csvnames = Import-Csv -Path $csv
$videos = Get-ChildItem -Path $path

foreach ($name in $csvnames) {
    foreach ($v in $videos) {
        if($name.BaseName -eq $v.Basename){
            rename-item $v.fullname -NewName "$($name.NewName)$($v.extension)" -Verbose
        }
    }
}
Write-Host "~*~ END RENAME FROM CSV ~*~" -ForegroundColor Green