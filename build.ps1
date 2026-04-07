# Vérification et téléchargement de nuget.exe si nécessaire
if (-not (Test-Path "nuget.exe")) {
    Write-Host "Téléchargement de nuget.exe en cours..." -ForegroundColor Yellow
    Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile "nuget.exe"
}

# Génération du package NuGet
Write-Host "Création du fichier .nupkg en cours..." -ForegroundColor Cyan
.\nuget.exe pack AutoCAD.NET.AcLayer.nuspec

Write-Host "Terminé ! Votre fichier .nupkg est prêt." -ForegroundColor Green
Pause