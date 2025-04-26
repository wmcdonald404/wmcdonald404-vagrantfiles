$SecurityGroups = @(
    @{
        Name = "Officers"
        SamAccountName = "Officers"
        GroupCategory = "Security"
        GroupScope = "DomainLocal"
        DisplayName = "Bridge Officers"
        Description = "Members of Bridge Officers"
    }

    @{
        Name = "Engineers" 
        SamAccountName = "Engineers" 
        GroupCategory = "Security" 
        GroupScope = "DomainLocal" 
        DisplayName = "Engineering Crew"
        Description = "Members of Engineering Crew"
    }
)

$SecurityGroups | foreach { New-ADGroup @_ }

# If we start to structure using OUs include the Path
# Path = "CN=Users,DC=Nostromo,DC=Com"
# Path = "CN=Users,DC=Nostromo,DC=Com"