# Fonction pour supprimer les caractères spéciaux et normaliser les noms
function Normalize-UserName {
    param ([string]$UserName)

    # Suppression des accents et conversion des caractères spéciaux
    $Normalized = $UserName -replace '[\p{M}]', ''       # Supprime les accents
    $Normalized = $Normalized -replace "[-' ]", ''      # Supprime tirets, apostrophes, espaces
    $Normalized = $Normalized -replace '[^a-zA-Z0-9]', '' # Supprime tout caractère non alphanumérique
    return $Normalized.ToLower()
}

# Fonction pour créer des dossiers utilisateurs et configurer la sécurité
function Create-UserFoldersWithPermissions {
    param (
        [string]$BasePath,
        [string[]]$Users
    )

    if (-Not (Test-Path -Path $BasePath)) {
        Write-Output "Le chemin de base $BasePath n'existe pas."
        return
    }

    foreach ($User in $Users) {
        # Normaliser le nom d'utilisateur
        $FormattedName = Normalize-UserName -UserName $User
        $FolderPath = Join-Path -Path $BasePath -ChildPath $FormattedName

        try {
            # Créer le dossier
            New-Item -ItemType Directory -Path $FolderPath -Force | Out-Null
            Write-Output "Dossier créé : $FolderPath"

            # Configurer la sécurité
            $Acl = Get-Acl -Path $FolderPath

            # Désactiver l'héritage et supprimer les permissions existantes
            Write-Output "Désactivation de l'héritage et suppression des permissions existantes pour : $FolderPath"
            $Acl.SetAccessRuleProtection($True, $False)
            $Acl.Access | ForEach-Object { $Acl.RemoveAccessRule($_) }

            # Ajouter les administrateurs du serveur avec "Full Control"
            $AdminRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrators", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
            $Acl.AddAccessRule($AdminRule)

            # Ajouter l'utilisateur concerné (le nom du dossier) avec "Full Control"
            Write-Output "Ajout de l'utilisateur $FormattedName avec Full Control"
            $UserRule = New-Object System.Security.AccessControl.FileSystemAccessRule($FormattedName, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
            $Acl.AddAccessRule($UserRule)

            # Appliquer les modifications ACL
            Set-Acl -Path $FolderPath -AclObject $Acl

        } catch {
            Write-Output "Erreur lors de la création du dossier ou configuration de la sécurité pour $FolderPath : $_"
        }
    }
}

# Importer le module Excel (assurez-vous qu'il est installé)
Install-Module -Name ImportExcel -Force

# Extraire les données depuis Excel pour les utilisateurs
$Utilisateurs = Import-Excel -Path "C:\Users\Administrator\Documents\s01_BillU.xlsx" | `
    Where-Object { $_.Prenom -ne $null -and $_.Nom -ne $null } | `
    ForEach-Object { "$($_.Prenom[0])$($_.Nom)" } | Sort-Object -Unique

# Chemin de base pour les utilisateurs
$CheminUtilisateurs = "\\SRVWIN-SMB\SharedFolders\Utilisateurs"

# Créer les dossiers pour les utilisateurs
Write-Output "Création des dossiers pour les utilisateurs :"
Create-UserFoldersWithPermissions -BasePath $CheminUtilisateurs -Users $Utilisateurs
