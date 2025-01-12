# Script PowerShell pour créer automatiquement des dossiers pour les services et les utilisateurs

# Fonction pour créer des dossiers
function Create-Folders {
    param (
        [string]$BasePath,
        [string[]]$Names
    )

    if (-Not (Test-Path -Path $BasePath)) {
        Write-Output "Le chemin de base $BasePath n'existe pas."
        return
    }

    foreach ($Name in $Names) {
        $FolderPath = Join-Path -Path $BasePath -ChildPath $Name
        try {
            New-Item -ItemType Directory -Path $FolderPath -Force | Out-Null
            Write-Output "Dossier créé : $FolderPath"
        } catch {
            Write-Output "Erreur lors de la création du dossier $FolderPath : $_"
        }
    }
}

# Liste des services et des utilisateurs extraits du fichier Excel
# Remplacez les appels suivants par vos propres extractions depuis Excel si nécessaire
$Services = Import-Excel -Path "C:\Users\Administrator\Documents\s01_BillU.xlsx" | Where-Object { $_.Service -ne $null } | Select-Object -ExpandProperty Service -Unique
$Utilisateurs = Import-Excel -Path "C:\Users\Administrator\Documents\s01_BillU.xlsx" | Where-Object { $_.Prenom -ne $null -and $_.Nom -ne $null } | ForEach-Object { "$($_.Prenom) $($_.Nom)" } | Sort-Object -Unique

# Chemins de base
$CheminServices = "\\SRVWIN-SMB\SharedFolders\Services"
$CheminUtilisateurs = "\\SRVWIN-SMB\SharedFolders\Utilisateurs"

# Créer les dossiers pour les services
Write-Output "Création des dossiers pour les services :"
Create-Folders -BasePath $CheminServices -Names $Services

# Créer les dossiers pour les utilisateurs
Write-Output "\nCréation des dossiers pour les utilisateurs :"
Create-Folders -BasePath $CheminUtilisateurs -Names $Utilisateurs
