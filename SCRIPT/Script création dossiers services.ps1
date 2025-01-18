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

            # Désactiver l'héritage
            $Acl = Get-Acl -Path $FolderPath
            $Acl.SetAccessRuleProtection($True, $False)  # Désactiver l'héritage et ne pas propager les règles existantes
            Set-Acl -Path $FolderPath -AclObject $Acl

            # Ajouter les administrateurs en Full Control
            $AdminGroup = "Administrators"
            $AdminAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $AdminGroup,
                "FullControl",
                "ContainerInherit,ObjectInherit",
                "None",
                "Allow"
            )
            $Acl.AddAccessRule($AdminAccessRule)

            # Ajouter un groupe spécifique avec des permissions (tout sauf Full Control)
            $GroupName = "$Name"  # Le nom du groupe correspond au nom du dossier
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $GroupName,
                "Modify",
                "ContainerInherit,ObjectInherit",
                "None",
                "Allow"
            )

            # Ajouter la règle d'accès pour le groupe
            $Acl.AddAccessRule($AccessRule)

            # Appliquer les modifications de sécurité
            Set-Acl -Path $FolderPath -AclObject $Acl

            Write-Output "Permissions modifiées pour le dossier : $FolderPath"
        } catch {
            Write-Output "Erreur lors de la création ou de la modification du dossier $FolderPath : $_"
        }
    }
}

Install-Module -Name ImportExcel -Force

# Liste des services extraits du fichier Excel
$Services = Import-Excel -Path "C:\Users\Administrator\Documents\s01_BillU.xlsx" | Where-Object { $_.Service -ne $null } | Select-Object -ExpandProperty Service -Unique

# Chemin de base
$CheminServices = "\\SRVWIN-SMB\SharedFolders\Services"

# Créer les dossiers pour les services
Write-Output "Création des dossiers pour les services :"
Create-Folders -BasePath $CheminServices -Names $Services
