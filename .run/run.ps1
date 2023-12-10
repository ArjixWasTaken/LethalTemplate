Set-Location "$PSScriptRoot\.."

##### <Config>
$gameName = "Lethal Company"
$gameRoot = "C:\Games\$gameName"
$pluginsRoot = "${gameRoot}\BepInEx\plugins"
##### </Config>

#### <Init>
$ErrorActionPreference = "Stop"
$projectName = [System.IO.Path]::GetFileNameWithoutExtension(@(Get-ChildItem -Filter "*.csproj")[0].Name)
#### </Init>

##### <BeforeBuild>
$process = Get-Process -Name "$gameName" -ErrorAction SilentlyContinue
if ($process) {
    Stop-Process -Id $process.Id -ErrorAction Stop
    $process.WaitForExit()
}
##### </BeforeBuild>

##### <Utils>
function New-TempDir {
    ## Source: https://stackoverflow.com/a/54935264
    
    $parent = [System.IO.Path]::GetTempPath()
    do {
        $name = [System.IO.Path]::GetRandomFileName()
        $item = New-Item -Path $parent -Name $name -ItemType "directory" -ErrorAction SilentlyContinue
    } while (-not $item)
    return $item.FullName
}
##### </Utils>

##### <Build>
$buildDir = New-TempDir

dotnet build -c=Release -o="$buildDir" --nologo "$projectName.csproj"
if (-not $?) {
    Write-Host "Failed to build project"
    return 1
}

$assemblyPath = "$buildDir\$projectName.dll"

Copy-Item -Path $assemblyPath -Destination $pluginsRoot -Force
##### </Build>

##### <AfterBuild>
Remove-Item -Path $buildDir -Recurse -Force

if ($env:RUN -eq "1") {
    Start-Process -FilePath "$gameRoot\$gameName.exe"    
}
##### </AfterBuild>
