## LethalTemplate

Welcome to **LethalTemplate**, a BepInEx 5 plugin template for [Lethal Company](https://store.steampowered.com/app/1966720/Lethal_Company/)!

This template is aimed towards [Rider](https://www.jetbrains.com/rider/) users, [although you can still use this template w/o Rider](#usage-outside-of-rider).

This template doesn't provide much, below you can see the things provided out of the box:

- [NStrip](https://github.com/bbepis/NStrip)'ed DLLs under the `libs` directory. 
- A powershell script for:
- - Building the plugin and copying it to the game directory.
- - Building the plugin and running the game with it.


---
### Usage Outside Of Rider

Two configurations are provided for Rider, `Build` and `Run`.

`Build`:
```powershell
. .run\run.ps1
```

`Run`:
```powershell
$env:RUN=1
. .run\run.ps1
```
