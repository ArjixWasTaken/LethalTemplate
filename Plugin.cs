using BepInEx;
using BepInEx.Logging;
using HarmonyLib;

namespace LethalTemplate;

[BepInPlugin(MyPluginInfo.PLUGIN_GUID, MyPluginInfo.PLUGIN_NAME, MyPluginInfo.PLUGIN_VERSION)]
public class Plugin : BaseUnityPlugin
{
    readonly Harmony _harmony = new(MyPluginInfo.PLUGIN_GUID);
    private readonly ManualLogSource _log = new("LethalTemplate");

    private void Awake()
    {
        _harmony.PatchAll();
        
        _log.LogInfo($"Plugin {MyPluginInfo.PLUGIN_GUID} is loaded!");
    }
}
