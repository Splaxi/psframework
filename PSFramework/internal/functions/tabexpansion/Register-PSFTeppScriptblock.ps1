﻿function Register-PSFTeppScriptblock
{
    <#
        .SYNOPSIS
            Registers a scriptblock under name, to later be available for TabExpansion.
        
        .DESCRIPTION
            Registers a scriptblock under name, to later be available for TabExpansion.
        
        .PARAMETER ScriptBlock
            The scriptblock to register.
        
        .PARAMETER Name
            The name under which the scriptblock should be registered.
        
        .EXAMPLE
            Register-PSFTeppScriptblock -ScriptBlock $scriptBlock -Name MyFirstTeppScriptBlock
    
            Stores the scriptblock stored in $scriptBlock under the name "MyFirstTeppScriptBlock"
    #>
	[CmdletBinding()]
	Param (
		[System.Management.Automation.ScriptBlock]
		$ScriptBlock,
		
		[string]
		$Name
	)
	
	$scp = New-Object PSFramework.TabExpansion.ScriptContainer
	$scp.Name = $Name.ToLower()
	$scp.ScriptBlock = $ScriptBlock
	$scp.LastDuration = New-TimeSpan -Seconds -1
	
	[PSFramework.TabExpansion.TabExpansionHost]::Scripts[$Name.ToLower()] = $scp
}
