# Script PowerShell pour la creation d'OU et de groupe dans l'ADDS

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
    
# Fonction pour creer un OU
function CreateOu {

    while ($true) {
        Write-Host "`n<=== CREATION 'OU' ===>`n" -f $Green
        Write-Host "[1] " -ForegroundColor $CYAN -NoNewline; Write-Host "Creer un OU dans la racine"
        Write-Host "[2] " -ForegroundColor $CYAN -NoNewline; Write-Host "Creer un OU dans un chemin specifique"
        Write-Host "[3] " -ForegroundColor $Red -NoNewline; Write-Host "Retour au menu precedent`n"
        $choix = Read-Host "Veuillez choisir une option "

    switch ($choix) {
            "1" {
            Write-Host ""    
        $NameOu = Read-Host "Veuillez renseigner le nom de votre OU "
        try {
            New-ADOrganizationalUnit -Name "$NameOu" -Path "DC=billu,DC=com"
            Write-Host "`nL'OU '$NameOu' a ete cree avec succes.`n" -ForegroundColor Green
        } 
        catch {
            Write-Host "`n[ERREUR]! L'OU '$NameOu' n'a pas ete cree.`n" -ForegroundColor Red
        }
        
        }

        "2" {
            Write-Host ""    
        $NameOu = Read-Host "Veuillez renseigner le nom de votre OU "
            write-Host ""
        $LocationOu = Read-Host "Veuillez renseigner l'emplacement de destination de votre OU "
        try {
            New-ADOrganizationalUnit -Name "$NameOu" -Path "OU=$LocationOu,DC=billu,DC=com"
            Write-Host "`nL'OU '$NameOu' a ete cree avec succes.`n" -ForegroundColor Green
        } 
        catch {
            Write-Host "`n[ERREUR]! L'OU '$NameOu' n'a pas ete cree.`n" -ForegroundColor Red
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
# Fonction pour creer un groupe
function CreateGroup {

    while ($true) {
        Write-Host "`n<=== CREATION 'GROUPES' ===>`n" -f $Green
        Write-Host "[1] " -ForegroundColor $CYAN -NoNewline; Write-Host "Creer un groupe dans la racine"
        Write-Host "[2] " -ForegroundColor $CYAN -NoNewline; Write-Host "Creer un groupe dans un chemin specifique"
        Write-Host "[3] " -ForegroundColor $Red -NoNewline; Write-Host "Retour au menu precedent`n"
        $choix = Read-Host "Veuillez choisir une option "
    
    switch ($choix) {
        "1" {
            Write-Host ""    
        $NameGroup = Read-Host "Veuillez renseigner le nom de votre groupe "
        try {
            New-ADGroup -Name "$NameGroup" -Path "DC=billu,DC=com" -GroupScope Global -GroupCategory Security
            Write-Host "`nLe groupe '$NameGroup' a ete cree avec succes.`n" -ForegroundColor Green
         }
        catch {
            Write-Host "`n[ERREUR]! Le groupe '$NameGroup' n'a pas ete cree.`n" -ForegroundColor Red
        }
            }

        "2" {
            Write-Host ""    
        $NameGroup = Read-Host "Veuillez renseigner le nom de votre groupe "
            write-Host ""
        $LocationGroup = Read-Host "Veuillez renseigner l'emplacement de destination de votre OU "
            try {
            New-ADGroup -Name "$NameGroup" -Path "OU=$LocationGroup,DC=billu,DC=com" -GroupScope Global -GroupCategory Security
            Write-Host "`nLe groupe '$NameGroup' a ete cree avec succes.`n" -ForegroundColor Green
         }
        catch {
            Write-Host "`n[ERREUR]! Le groupe '$NameGroup' n'a pas ete cree.`n" -ForegroundColor Red
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
    Write-Host "[3] " -ForegroundColor $Yellow -NoNewline; Write-Host "Creer un OU"
    Write-Host "[4] " -ForegroundColor $Yellow -NoNewline; Write-Host "Creer un groupe"
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
