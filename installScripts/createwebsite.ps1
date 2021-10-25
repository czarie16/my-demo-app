 #############################################
 # am I running in 32 bit shell?
 #############################################
 if ($pshome -like "*syswow64*") {
 
    Write-Warning "Restarting script under 64 bit powershell"
  
    # relaunch this script under 64 bit shell
    & (join-path ($pshome -replace "syswow64", "sysnative") powershell.exe) -file `
      (join-path $psscriptroot $myinvocation.mycommand) @args
  
    # exit 32 bit script
    exit $lastexitcode
  }

#
# Variable Definition
#
$webAppName = "MyWebApp"
$website = "Default Web Site"

$webAppPath = "c:\inetpub\wwwroot\" + $webAppName
$webApplication = "IIS:\sites\" + $website + "\" + $webAppName

# Set up the web application in the default web site.
#
New-WebApplication -Name $webAppName -ApplicationPool ".NET v4.5" -PhysicalPath $webAppPath -Site $website -force
