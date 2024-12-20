# Désactiver les paramètres de télémétrie de Windows

# La principale fonction de désactivation
function Disable-ServiceIfExists {
    param (
        [string]$ServiceName
    )
    if (Get-Service -Name $ServiceName -ErrorAction SilentlyContinue) {
        Stop-Service -Name $ServiceName -Force
        Set-Service -Name $ServiceName -StartupType Disabled
        Write-Host "Service '$ServiceName' disabled." -ForegroundColor Green
    } else {
        Write-Host "Service '$ServiceName' not found. Skipping..." -ForegroundColor Yellow
    }
}

# 1. Nom des services de télémétrie
Disable-ServiceIfExists -ServiceName "DiagTrack"               # Expériences d'utilisateurs connectés et télémétrie
Disable-ServiceIfExists -ServiceName "dmwappushservice"        # Gestion des appareils Protocole d'application sans fil
Disable-ServiceIfExists -ServiceName "diagnosticshub.standardcollector.service"

# 2. Modifier les paramètres de télémétrie dans le registre
$telemetryRegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
if (-not (Test-Path $telemetryRegPath)) {
    New-Item -Path $telemetryRegPath -Force | Out-Null
}
Set-ItemProperty -Path $telemetryRegPath -Name "AllowTelemetry" -Value 0  # Désactiver la télémétrie (0 = Security level)

Write-Host "Telemetry level set to 0 (Security)." -ForegroundColor Green

# 3. Bloquer les domaines de télémétrie dans le fichier hôte
$telemetryDomains = @(
    "vortex.data.microsoft.com",
    "vortex-win.data.microsoft.com",
    "telemetry.microsoft.com",
    "settings-win.data.microsoft.com",
    "oca.telemetry.microsoft.com"
)
$hostsFile = "C:\Windows\System32\drivers\etc\hosts"

foreach ($domain in $telemetryDomains) {
    if (-not (Select-String -Path $hostsFile -Pattern $domain -Quiet)) {
        Add-Content -Path $hostsFile -Value "127.0.0.1 $domain"
        Write-Host "Blocked domain: $domain" -ForegroundColor Green
    } else {
        Write-Host "Domain $domain is already blocked." -ForegroundColor Yellow
    }
}

# 4. Valider les paramètres appliqués
Write-Host "Validating telemetry services and settings..." -ForegroundColor Cyan
Get-Service -Name "DiagTrack", "dmwappushservice", "diagnosticshub.standardcollector.service" | Select-Object Name, Status, StartType
Get-ItemProperty -Path $telemetryRegPath | Select-Object AllowTelemetry
