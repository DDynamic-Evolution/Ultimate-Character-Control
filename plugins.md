# Plugins

Plugins are optional, modular scripts that extend UCC functionality. Each plugin listens on link channel 500 (plugin control).

---

## Available Plugins

### Redress Timer
Automatically redresses you once no one is within a specified range, after a variable delay.

### Randomizer
Selects a random outfit every X seconds.

### Follow
Lets you pick an avatar to follow automatically.

### Bumper / Snatcher
Lets you lose clothing if you run into someone, or if someone runs into you.

### Hoverheight
Automatically adjusts your hover height based on the currently worn outfit. See [Hoverheight](hoverheight.md).

---

## Creating a Custom Plugin

Plugin scripts must be named with a leading `app.` prefix (e.g. `app.MyPlugin.lsl`).

```lsl
// This script should be named with a leading 'app.' in its name
default
{
    link_message(integer link, integer chan, string msg, key id)
    {
        if (chan == 500)
        {
            list scriptname = llParseString2List(llGetScriptName(), ["."], []);
            if (msg == llList2String(scriptname, 1))
            {
                llOwnerSay("Hello World!");
            }
        }
    }
}
```

---

## Removing a Plugin

Go to **Options → RemovePlugin** and select the plugin to remove.
