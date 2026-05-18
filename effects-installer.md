# Effects & Installer

## Effects

Purchase an effect, place the effect prim in the correct folder, then use the included installer.

### Effect Script Example (LSL)

```lsl
integer status = FALSE;
default
{
    link_message(integer link, integer chan, string msg, key id)
    {
        if (chan == 765)
        {
            list scriptname = llParseString2List(llGetScriptName(), ["."], []);
            if (msg == llList2String(scriptname, 1))
            {
                if (status)
                {
                    status = FALSE;
                    llOwnerSay("Effect off");
                }
                else if (!status)
                {
                    llSleep(1);
                    status = TRUE;
                    llOwnerSay("Effect on");
                }
            }
        }
        else if (chan == 550)
        {
            if (status == TRUE && id == "redress") { /* do things */ }
            if (status == TRUE && id == "outfit")  { /* do things */ }
            if (status == TRUE && id == "avatar")  { /* do things */ }
        }
    }
}
```

---

## Installer

The built-in installer (`core.installer.lsl`) automatically creates the required RLV folder structure in your inventory.

### How to Use

1. Click your UCC2 HUD or object
2. Go to **Options** → **Installer**
3. Accept the folder offers in the inventory popup
4. Delete the `deleteme` notecards from the new folders afterward

### Folders Created

```
#RLV/~undressify/
#RLV/~undressify/av/
#RLV/~undressify/of/
#RLV/~undressify/addon/
#RLV/~undressify/av_addons/
```

**Note:** `avspec` is enabled by default. Create one outfit folder per avatar manually:
```
#RLV/~undressify/of_<avatarname>/
```

### Requirements

- RLV must be enabled in your viewer
- A notecard named `deleteme` must exist in the UCC2 object's inventory (serves as placeholder)
