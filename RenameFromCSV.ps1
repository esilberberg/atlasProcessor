Write-Host "~*~ RENAME FROM CSV ~*~" -ForegroundColor Green
Write-Host "Files in directory that are not listed in the CSV are not renamed." -ForegroundColor Green
$path = Read-Host -Prompt "Please copy and paste the video directory path"

Write-Host "The CSV file must have a column BaseName that indicates the current file name and a column NewName that indicates the desired file name." -ForegroundColor Green
$csv = Read-Host -Prompt "Drag and drop CSV file and remove any quotes around file path"

$csvnames = Import-Csv -Path $csv
$videos = Get-ChildItem -Path $path

# create output folder

$output_folder = Join-Path -Path $path -ChildPath "RenamedFiles"

if (Test-Path -Path $output_folder) {
    "Exporting to directory: RenamedFiles"
} else {
    New-Item -Path $path -Name "RenamedFiles" -ItemType "directory" -Force
}

# rename and move files

foreach ($name in $csvnames) {
    foreach ($v in $videos) {
        if($name.BaseName -eq $v.Basename){
            $new_name = "$($name.NewName)_RI$($v.extension)"
            $new_name_path = Join-Path -Path $path -ChildPath $new_name
            rename-item $v.fullname -NewName $new_name -Verbose
            Move-Item $new_name_path -destination $output_folder
        }
    }
}
Write-Host "~*~ END RENAME FROM CSV ~*~" -ForegroundColor Green
