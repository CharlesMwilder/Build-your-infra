# Script PowerShell pour la création d'OU et de groupe dans l'ADDS

# Creation des variables Couleurs
$Green = "Green"
$Yellow = "Yellow"
$White = "White"
$Red = "Red"
$Cyan= "Cyan"

# Fonction pour voir la liste des OU du domaine
function OuList {
    Import-Module ActiveDirectory
    Get-ADOrganizationalUnit -Filter 'Name -like "*"' -Server "billu.com" | Format-Table Name, DistinguishedName -AutoSize
}

# Fonction pour voir la liste des groupes du domaine
function GroupList {
    write-Host ""
    Import-Module ActiveDirectory
    Get-ADGroup -Filter 'Name -like "*"' -Server "billu.com" | Format-Table Name, GroupScope, DistinguishedName -AutoSize
    }
    
# Fonction pour créer un OU
function CreateOu {

    while ($true) {
        Write-Host "`n<=== CREATION 'OU' ===>`n" -f $Green
        Write-Host "[1] " -ForegroundColor $CYAN -NoNewline; Write-Host "Créer un OU dans la racine"
        Write-Host "[2] " -ForegroundColor $CYAN -NoNewline; Write-Host "Créer un OU dans un chemin spécifique"
        Write-Host "[3] " -ForegroundColor $Red -NoNewline; Write-Host "Retour au menu précédent`n"
        $choix = Read-Host "Veuillez choisir une option "

    switch ($choix) {
            "1" {
            Write-Host ""    
        $NameOu = Read-Host "Veuillez renseigner le nom de votre OU "
        try {
            New-ADOrganizationalUnit -Name "$NameOu" -Path "DC=billu,DC=com"
            Write-Host "`nL'OU '$NameOu' a été créé avec succès.`n" -ForegroundColor Green
        } 
        catch {
            Write-Host "`n[ERREUR]! L'OU '$NameOu' n'a pas été créé.`n" -ForegroundColor Red
        }
        
        }

        "2" {
            Write-Host ""    
        $NameOu = Read-Host "Veuillez renseigner le nom de votre OU "
            write-Host ""
        $LocationOu = Read-Host "Veuillez renseigner l'emplacement de destination de votre OU "
        try {
            New-ADOrganizationalUnit -Name "$NameOu" -Path "OU=$LocationOu,DC=billu,DC=com"
            Write-Host "`nL'OU '$NameOu' a été créé avec succès.`n" -ForegroundColor Green
        } 
        catch {
            Write-Host "`n[ERREUR]! L'OU '$NameOu' n'a pas été créé.`n" -ForegroundColor Red
        }
        
        } 
     
        "3" {
            return
        }

        default {
            Write-Host "`nChoix invalide, veuillez recommencer" -f $Red
        }
    }
  }
}
# Fonction pour créer un groupe
function CreateGroup {

    while ($true) {
        Write-Host "`n<=== CREATION 'GROUPES' ===>`n" -f $Green
        Write-Host "[1] " -ForegroundColor $CYAN -NoNewline; Write-Host "Créer un groupe dans la racine"
        Write-Host "[2] " -ForegroundColor $CYAN -NoNewline; Write-Host "Créer un groupe dans un chemin spécifique"
        Write-Host "[3] " -ForegroundColor $Red -NoNewline; Write-Host "Retour au menu précédent`n"
        $choix = Read-Host "Veuillez choisir une option "
    
    switch ($choix) {
        "1" {
            Write-Host ""    
        $NameGroup = Read-Host "Veuillez renseigner le nom de votre groupe "
        try {
            New-ADGroup -Name "$NameGroup" -Path "DC=billu,DC=com" -GroupScope Global -GroupCategory Security
            Write-Host "`nLe groupe '$NameGroup' a été créé avec succès.`n" -ForegroundColor Green
         }
        catch {
            Write-Host "`n[ERREUR]! Le groupe '$NameGroup' n'a pas été créé.`n" -ForegroundColor Red
        }
            }

        "2" {
            Write-Host ""    
        $NameGroup = Read-Host "Veuillez renseigner le nom de votre groupe "
            write-Host ""
        $LocationGroup = Read-Host "Veuillez renseigner l'emplacement de destination de votre OU "
            try {
            New-ADGroup -Name "$NameGroup" -Path "OU=$LocationGroup,DC=billu,DC=com" -GroupScope Global -GroupCategory Security
            Write-Host "`nLe groupe '$NameGroup' a été créé avec succès.`n" -ForegroundColor Green
         }
        catch {
            Write-Host "`n[ERREUR]! Le groupe '$NameGroup' n'a pas été créé.`n" -ForegroundColor Red
        }
            }         
        "3" {
            return
        }

        default {
            Write-Host "`nChoix invalide, veuillez recommencer" -f $Red
        }
    }
}
}
# Boucle du menu
while ($true) {
    Write-Host "`n<=== MENU GESTION ACTIVE DIRECOTRY ===>`n" -f $Green
    Write-Host "[1] " -ForegroundColor $CYAN -NoNewline; Write-Host "Liste des OU"
    Write-Host "[2] " -ForegroundColor $CYAN -NoNewline; Write-Host "Liste des Groupes"
    Write-Host "[3] " -ForegroundColor $Yellow -NoNewline; Write-Host "Créer un OU"
    Write-Host "[4] " -ForegroundColor $Yellow -NoNewline; Write-Host "Créer un groupe"
    Write-Host "[x] " -ForegroundColor $Red -NoNewline; Write-Host "Sortir`n"
    $choix = Read-Host "Veuillez choisir une option "

    switch ($choix) {
        "1" {
            Write-Host "`nListe des OU :`n" -f $Yellow
            OuList
         }
        "2" {
            Write-Host "`nListe des groupes :`n" -f $Yellow
            GroupList
         }    
        "3" {
            CreateOu
         }
        "4" {
            CreateGroup
         }       
        "x" {
            Write-Host " `nExit`n" -f $Yellow
            exit 0
        }

        default {
            Write-Host "`nChoix invalide, veuillez recommencer" -f $Red
        }
    }
}
