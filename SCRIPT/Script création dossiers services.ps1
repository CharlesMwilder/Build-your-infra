# Fonction pour créer des dossiers et configurer la sécurité
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
            # Créer le dossier
            New-Item -ItemType Directory -Path $FolderPath -Force | Out-Null
            Write-Output "Dossier créé : $FolderPath"

            # Désactiver l'héritage et supprimer toutes les règles existantes
            $Acl = Get-Acl -Path $FolderPath
            $Acl.SetAccessRuleProtection($True, $False)  # Désactiver l'héritage sans propagation
            $Acl.Access | ForEach-Object { $Acl.RemoveAccessRule($_) }  # Supprimer toutes les règles existantes

            # Ajouter les administrateurs avec Full Control
            $AdminGroup = "Administrators"
            $AdminAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $AdminGroup,
                "FullControl",  # Full Control pour les administrateurs
                "ContainerInherit,ObjectInherit",
                "None",
                "Allow"
            )
            $Acl.AddAccessRule($AdminAccessRule)

            # Ajouter le groupe de service avec des permissions "Modify" mais sans "Full Control"
            $GroupName = "$Name"  # Le nom du groupe est le même que le nom du dossier
            $GroupAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $GroupName,
                "Modify",  # Modifier les fichiers sans gérer les permissions
                "ContainerInherit,ObjectInherit",
                "None",
                "Allow"
            )

            # Ajouter la règle d'accès pour le groupe de service
            $Acl.AddAccessRule($GroupAccessRule)

            # Appliquer les modifications de sécurité
            Set-Acl -Path $FolderPath -AclObject $Acl

            Write-Output "Permissions modifiées pour le dossier : $FolderPath"
        } catch {
            Write-Output "Erreur lors de la création ou de la modification du dossier $FolderPath : $_"
        }
    }
}


# Liste des services extraits du fichier Excel
$Services = Import-Excel -Path "C:\Users\Administrator\Documents\s01_BillU.xlsx" | Where-Object { $_.Service -ne $null } | Select-Object -ExpandProperty Service -Unique

# Chemin de base
$CheminServices = "\\SRVWIN-SMB\SharedFolders\Services"

# Créer les dossiers pour les services
Write-Output "Création des dossiers pour les services :"
Create-Folders -BasePath $CheminServices -Names $Services
