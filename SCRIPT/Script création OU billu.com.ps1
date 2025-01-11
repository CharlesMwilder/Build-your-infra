# Script PowerShell pour créer une hiérarchie spécifique d'OUs dans ADDS

# Couleurs pour l'affichage
$Green = "Green"
$Red = "Red"
$Cyan = "Cyan"

# Fonction pour créer une hiérarchie spécifique d'OU
function CreerHierarchieOU {
    Write-Host "`n<=== CREATION AUTOMATIQUE D'UNE HIERARCHIE D'OU ===>`n" -f $Green

    $ouParis = "OU=Paris,DC=billu,DC=com"
    $ouDepartements = "OU=Departements,$ouParis"
    $subOus = @("Commercial", "Communication", "Developpement", "Direction", "DSI", "Finance", "Juridique", "QHSE", "Recrutement")
    $subSubOus = @("Service", "Utilisateurs")

    try {
        # Création de l'OU racine Paris
        New-ADOrganizationalUnit -Name "Paris" -Path "DC=billu,DC=com" -ErrorAction Stop
        Write-Host "`nL'OU 'Paris' a été créée avec succès.`n" -ForegroundColor Green

        # Création de l'OU Departements
        New-ADOrganizationalUnit -Name "Departements" -Path $ouParis -ErrorAction Stop
        Write-Host "`nL'OU 'Departements' a été créée avec succès.`n" -ForegroundColor Green

        # Création des sous-OUs (Commercial, Communication, Finance)
        foreach ($ou in $subOus) {
            $currentOuPath = "OU=$ou,$ouDepartements"
            New-ADOrganizationalUnit -Name $ou -Path $ouDepartements -ErrorAction Stop
            Write-Host "`nL'OU '$ou' a été créée avec succès.`n" -ForegroundColor Green

            # Création des sous-sous-OUs (Service, Utilisateurs)
            foreach ($subOu in $subSubOus) {
                New-ADOrganizationalUnit -Name $subOu -Path $currentOuPath -ErrorAction Stop
                Write-Host "  L'OU '$subOu' a été créée sous '$ou'.`n" -ForegroundColor Cyan
            }
        }
    } catch {
        Write-Host "`n[ERREUR] Une erreur s'est produite lors de la création des OU : $_`n" -ForegroundColor Red
    }
}

# Appel de la fonction pour exécuter la création
CreerHierarchieOU
