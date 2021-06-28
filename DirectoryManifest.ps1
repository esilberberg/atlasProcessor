Write-Host "~*~ DIRECTORY MANIFEST ~*~" -ForegroundColor Yellow

$path = Read-Host -Prompt "Please copy and paste the directory here"

$dir = Split-Path $path -Leaf

$size = @{Label='MB'; Expression={[math]::Round($_.length/1MB, 2)}}

$manifest = Get-ChildItem -Path $path | Select-Object BaseName,Extension,$size

$manifest | Export-Csv -NoTypeInformation $("$path\Manifest_$dir.csv")

Write-Host "~*~ END DIRECTORY MANIFEST ~*~" -ForegroundColor Yellow
