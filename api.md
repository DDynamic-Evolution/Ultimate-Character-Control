# API / Creators

UCC listens on **channel 5100** and sends on **channel 5200**.

---

## API Commands (sent on ch. 5100)

| Command               | Action                        |
|-----------------------|-------------------------------|
| `outfit~nameofoutfit` | Load outfit                   |
| `avatar~nameofavatar` | Load avatar                   |
| `reload`              | Reload current outfit         |
| `callav`              | Responds with current avatar  |
| `callof`              | Responds with current outfit  |
| `naked`               | Loads naked layers            |
| `ping`                | Find users on a region        |

---

## Chat Commands

| Command         | Action                    |
|-----------------|---------------------------|
| `/77 main`      | Opens main menu           |
| `/77 clothing`  | Opens current outfit      |
| `/77 avatars`   | Opens avatars             |
| `/77 outfits`   | Opens outfits             |
| `/77 options`   | Opens options             |
| `/77 naked`     | Loads naked layers        |
| `/77 reload`    | Reloads current outfit    |

---

## API Listener Example (LSL)

```lsl
default
{
    state_entry()
    {
        llGetOwner();
        llListen(5200,"","","");
        llListen(5100,"","","");
    }
    listen(integer chan, string name, key id, string msg)
    {
        if (llGetOwnerKey(id) == llGetOwner())
        {
            llOwnerSay((string)chan + " | " + name + ":" + msg);
        }
    }
}
```

---

## Plugin Example (LSL)

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

## Link Message Channels

| Channel | Purpose |
|---------|---------|
| 500 | Core → Plugins (plugin control commands) |
| 550 | Internal events: avatar switch, outfit load, redress |
| 700 | Core.main ↔ core.dialog (menu control) |
| 765 | Effects control |
| 5100 | External API input (region channel) |
| 5200 | External API output (region channel) |
| 5102 | HUD ↔ UCC communication |
