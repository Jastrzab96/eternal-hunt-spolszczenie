$RepoZipUrl = "https://raw.githubusercontent.com/Jastrzab96/eternal-hunt-spolszczenie/main/Eternal%20Hunt%20PL%20Translation.zip"

$FileName = "Eternal Hunt PL Translation.zip"
$Dir = Get-Location
$FilePath = Join-Path $Dir $FileName

Write-Host "Pobieranie archiwum ze spolszczeniem..."
Invoke-WebRequest `
    -Uri $RepoZipUrl `
    -OutFile $FilePath `
    -UseBasicParsing

if (-Not (Test-Path $FilePath)) {
    Write-Error "Nie udało się pobrać archiwum ZIP!"
    exit 1
}

#Write-Host "Rozpakowywanie..."
Expand-Archive -Path $FilePath -DestinationPath $Dir -Force

#Write-Host "Usuwanie ZIP..."
Remove-Item $FilePath

Write-Host "Spolszczenie zainstalowane!"

pause
