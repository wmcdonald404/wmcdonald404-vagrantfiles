$SecurityGroups = @(
    @{
        Name = "Officers"
        SamAccountName = "Officers"
        GroupCategory = "Security"
        GroupScope = "Global"
        DisplayName = "Bridge Officers"
        Description = "Members of Bridge Officers"
    }
    @{
        Name = "Engineers"
        SamAccountName = "Engineers"
        GroupCategory = "Security"
        GroupScope = "Global"
        DisplayName = "Engineering Crew"
        Description = "Members of Engineering Crew"
    }
)

function Initialize-Groups {
    $SecurityGroups | foreach { 
        New-ADGroup @_
    }
}

try {
    $SecurityGroups | foreach { Get-ADGroup $_.Name }
} catch {
    Initialize-Groups
}