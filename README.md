﻿## LethalTemplate

Welcome to **LethalTemplate**, a BepInEx 5 plugin template for [Lethal Company](https://store.steampowered.com/app/1966720/Lethal_Company/)!

---
This template doesn't provide much, below you can see the things provided out of the box:

- [NStrip](https://github.com/bbepis/NStrip)'ed DLLs under the `libs` directory. 
- A powershell script for:
- - Building the plugin and copying it to the game directory.
- - Building the plugin and running the game with it.

## Getting started

First of all, have you decided on a plugin name? </br>
Of course you have!

Run the following commands (in the root of the repository) to make this template use your name!
```powershell
$newName = "ExamplePluginName"

Get-ChildItem | Where {$_.Name -Match 'LethalTemplate'} | Rename-Item -NewName {$_.name -replace 'LethalTemplate', $newName }
Get-ChildItem -File -Recurse | Where {$_.FullName -notlike "*\.git\*" -and $_.FullName -notlike "*\bin\*" -and $_.FullName -notlike "*\obj\*" -and $_.Name -notlike "*.dll"} | ForEach { (Get-Content -Path $_.FullName -Raw) -replace 'LethalTemplate',$newName | Out-File -FilePath $_.FullName }
```

Furthermore, you need to modify `.run/run.ps1` so it knows where the game files are. </br>
Look for the `Config` section, mine is 
```powershell
##### <Config>
$gameName = "Lethal Company"
$gameRoot = "C:\Games\$gameName"
$pluginsRoot = "${gameRoot}\BepInEx\plugins"
##### </Config>
```
You will most likely only have to edit `$gameRoot`, as the other values won't change.

Finally, visit the [BepInEx](https://docs.bepinex.dev/articles/dev_guide/plugin_tutorial/3_logging.html) and [HarmonyX](https://github.com/BepInEx/HarmonyX/wiki) docs to learn the next steps!

**🎊 Happy hacking! 🎊**

---
### Usage

Two configurations are provided, `Build` and `Run`.

`Build`:
```powershell
. run.ps1
```

`Run`:
```powershell
$env:RUN=1
. run.ps1
```
