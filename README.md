# Ultimate Character Control (UCC)

**UCC — Ultimate Character Control** is a Second Life HUD/tool for managing avatar outfits, animations, sounds, and access control via RLV.

> Successor and rebranded version of the original UCC system, available on the [Second Life Marketplace](https://marketplace.secondlife.com/p/Disvail-Dynamics-Ultimate-Character-Control/27304089).

---

## Table of Contents

1. [Overview](#1-overview)
2. [Group & Discord](#2-group--discord)
3. [Optional HUD](#3-optional-hud)
4. [Avatar Folder Setup](#4-avatar-folder-setup)
5. [Addons & AvAddons](#5-addons--avaddons)
6. [Sounds & Animations](#6-sounds--animations)
7. [Hoverheight Control](#7-hoverheight-control)
8. [Options](#8-options)
9. [Access](#9-access)
10. [Plugins](#10-plugins)
11. [SafeSitter](#11-safesitter)
12. [Tips & Tricks](#12-tips--tricks)
13. [Config Notecard](#13-config-notecard)
14. [Additional Notecard Parameters](#14-additional-notecard-parameters)
15. [Effects](#15-effects)
16. [API / Creators](#16-api--creators)
17. [FAQ](#17-frequently-asked-questions)
18. [Changelog](#18-changelog)

---

## 1. Overview

Key Features:
- Custom sounds
- Custom animations for optional animated undressing
- Automatic hoverheight adjustment for boots and feet
- SafeSitter to protect you from unwanted people and objects when sitting
- Optional DiscordNotifier
- Random outfits and a redress timer
- Optional Bumper/Snatcher to lose outfit parts
- Follow your friends in a region

Advantages:
- Keep your complexity low by avoiding transparent body parts
- One avatar setup for multiple related outfits
- No need to search through your inventory to change clothing layers
- Faster, cleaner, and more intuitive experience overall

Requirements:
- Speak English
- Use an RLV-compatible viewer
- Use your brain

**Feedback & Support:** Report bugs or request features via [Discord](https://discord.gg/8J8aHkc6qu).

### Tested SL Clients

**Working:**
- Alchemy Viewer
- Aperture Viewer
- Firestorm Viewer
- Black Dragon
- Restrained Love Viewer
- Kokua Viewer
- Catznip
- Genesis
- Singularity
- Lumiya Mobile Client

**Not Recommended:**
- Radegast Text Viewer — no full RLV support
- mysmartbots — paid RLV, closed source
- Corrade Bot — RLV is super outdated, only 16 attachment points, very slow reaction time

**Not Working:**
- Megaphit — no RLV (yet)
- Official Second Life Viewer — no RLV

---

## 2. Group & Discord

- **Discord:** https://discord.gg/8J8aHkc6qu
- **Inworld Group:** Search for `Disvail Dynamics` in Second Life

> Note: Second Life groups are unreliable. Discord is the primary support channel.

---

## 3. Optional HUD

From version **1.95** you can use the optional HUD to access your UCC directly on-screen.

---

## 4. Avatar Folder Setup

> **!! NEVER KEEP THE TOOL WITHIN YOUR `~undressify` FOLDER !!**
> Doing so will cause the tool to be detached when you change avatars.

You must create the folder structure manually. This structure is essential for UCC to function properly.

### Required Folder Structure

**Avatar folder:**
```
#RLV/~undressify/av/youravatarname
```

Place your naked avatar into this folder. You can have multiple avatar folders. Load an avatar using the **Avatar** button.

### Outfit Folder (Default — one outfit folder per avatar)

You can organize outfits per avatar by enabling **avatar-specific mode** (`avspecific`).

```
#RLV/~undressify/of_avatarname/
└── nameofyouroutfit/
    ├── top_1
    ├── pants_1
    ├── top_2
    ├── pants_2
    ├── top_3
    ├── pants_3
    └── top_0 / pants_0 (optional)
```

### Folder Layer Meanings

Layers are restricted to three (3). Each folder suffix defines how the clothing behaves during undressing.

| Folder Suffix | Meaning                   | Notes                                          |
|---------------|---------------------------|------------------------------------------------|
| `_1`          | Top layer                 | Visible clothing                               |
| `_2`          | Underwear / secondary     | Optional                                       |
| `_3`          | Naked layer or extras     | Optional, requires `_2` to be present          |
| `_0`          | Hidden layer              | Inaccessible to others (e.g. tattoos, details) |

> Outfits with `*` in their name are only visible to you.

### Default Outfit (v1.99+)

Append `_d` to an outfit folder name to use it as the default outfit when loading that avatar:

```
outfitname_d
```

Notecard settings:
```
# Use a default outfit when loading an avatar. The outfit needs to be marked with "_d"
defoutfit=1
# Want the default outfit to be public?
defpublic=0
# A timeout when someone loads an outfit or avatar. So your assets have time to load.
timeout=30
```

### How to Use

1. Load an outfit using the **Outfits** button.
2. The **Clothing** button will appear next.
3. Click the **Clothing** button to preview how your clothing will be undressed.
4. Click your **belly** or **lower back** to open the menu and load your avatar, outfit, etc.
5. Go to the main menu and click **"outfit"** to begin.

---

## 5. Addons & AvAddons

> **Addons and AvAddons do NOT autoapply with your avatar and outfit!**

### Addons

Addons are items you'd like to load with **every avatar and outfit** — such as HUDs, toys, or utility tools.

```
#RLV
 └──~undressify
      └──addon
         └──category
            └──item
               └──your item goes here
```

Use categories to organize (e.g. `HUDs`, `Accessories`, `Scripts`).
Items are loaded globally, no matter which avatar or outfit is selected.

### AvAddons

AvAddons are items you'd like to load with your **current avatar and outfit only**.

```
#RLV
 └──~undressify
      └──av_addons
         └──avatar name
            └──category
               └──item
                  └──your item goes here
```

### Examples

- Global HUD: `#RLV/~undressify/addon/HUDs/gestureHUD/`
- Avatar-specific toy: `#RLV/~undressify/av_addons/avatarname/Toys/bubblewand/`

> All addon folders must be created **manually**.

**Since v1.63:**
- Selecting a different subfolder within the same category will automatically remove other items in that category.
- To **hide** any addon folder from the menu, add `*` to the end of the folder name.

Manage Addons via the **Options** menu.

### Complete Example Folder Layout

```
#RLV/
└── ~undressify/
    ├── addon/
    │   ├── HUDs/
    │   │   ├── gestureHUD/
    │   │   └── AOcontroller/
    │   ├── Accessories/
    │   │   ├── smartGlasses/
    │   │   └── wristwatch/
    │   └── Scripts/
    │       └── autoSit/
    │
    ├── effects/
    │   └── effectname/
    │
    ├── av_addons/
    │   ├── Luna/
    │   │   ├── Toys/
    │   │   │   ├── bubblewand/
    │   │   │   └── leash/
    │   │   ├── HUDs/
    │   │   │   └── lunaHUD/
    │   │   └── Accessories/
    │   │       └── collar/
    │   └── Rex/
    │      ├── Gear/
    │      │   ├── combatVest/
    │      │   └── scanner/
    │      └── HUDs/
    │          └── rexHUD/
    │
    ├── av/
    │   ├── Luna/
    │   └── Rex/
    │
    └── of/
        └── CasualLook/
            ├── top_1
            ├── pants_1
            ├── top_2
            ├── pants_2
            ├── top_3
            ├── pants_3
            ├── base_0
            └── stuff_0_0.100   ← optional item with hover height control
```

Tips:
- The folder under `of/` is your outfit name (e.g. `CasualLook`)
- Items use suffixes like `_1`, `_2`, `_3` to define layer priority
- Items with `_0` are optional base layers
- Append `_0.100`, `_0.050`, etc. to an item name to control avatar hover height

---

## 6. Sounds & Animations

**Sounds** correspond to folder names. A folder named `top_1` will play the sound named `top`. Place custom sound files inside the UCC object to override defaults.

**Animations** follow the same logic. A folder named `pants_2` will trigger the animation named `pants`.

---

## 7. Hoverheight Control

To automatically adjust hover height, include a folder like:

```
stuff_0_0.100
```

**Since v1.94**, two hover heights are supported based on your `.feet` notecard:

```
stuff_0_0.100_0.005
```

- `_0` — item won't appear in the dialog
- `_0.100` — sets hover height to **100mm above ground**
- `_0.005` — sets hover height to **5mm above ground** when undressing anything listed in your `.lower` config

Activate via: `Plugins > Hoverheight`

> If you sit on an object or the ground, hover height resets to 0.

---

## 8. Options

| Option          | Meaning                                                          | Notes          |
|-----------------|------------------------------------------------------------------|----------------|
| PGSafe          | Automatic system to control access in non-adult regions          | Optional       |
| Autoclean       | Auto-clean cum layer on redress                                  | Optional       |
| RemovePlugin    | Choose a plugin to remove                                        | Optional       |
| AVSpecific      | Choose whether to use `of` or `of_<avatarname>`                  | Optional       |
| Distance        | Minimum distance of avatars to use the system                    | Default: 15m   |
| Animations      | Animation system when dressing or undressing                     | Optional       |
| Sound           | Sound system when dressing or undressing                         | Optional       |
| Webhook         | Enter a webhook for your Discord channel to display statistics   | Optional       |
| SendData        | Deactivates/activates the webhook                                | Optional       |
| DistanceTracker | Tracks avatars clicking from too far away                        | Optional       |

---

## 9. Access

Access is controlled via the `.conf` notecard within UCC.

---

## 10. Plugins

- **Redress Timer** — Automatically redresses you once no one is within a specified range, after a variable delay.
- **Randomizer** — Selects a random outfit every X seconds.
- **Follow** — Lets you pick an avatar to follow automatically.
- **Bumper / Snatcher** — Lets you lose clothing if you run into someone, or if someone runs into you.

---

## 11. SafeSitter

SafeSitter is a specialized script that monitors avatars sitting on the same object as you. If someone matches a ban list, wears flagged items, or uses content from creators you choose not to support, SafeSitter will automatically react.

Configure blacklisted items, people, and creators from the notecards within UCC (look for notecards with `blacklist` and `whitelist` in the name).

**Core Functionality:**
- Scans co-sitters in real time
- Detects banned avatars or worn items
- Identifies blacklisted creators
- Forces you to stand and re-sit once the flagged avatar leaves the scan area

**Why SafeSitter?**
- Maintain control over shared seating
- Avoid unwanted interactions
- Enforce personal or community standards

SafeSitter runs silently and efficiently in the background.

---

## 12. Tips & Tricks

- If you change textures via a HUD (e.g. color or material changes), detach the item manually and reattach it after the change. Second Life may ignore HUD-based changes if the item is removed via RLV.
- You can place your own sounds inside the object to override defaults — just match the sound name to the folder prefix (e.g. `top` for `top_1`).

### Config Notecard and Updater

When you use the updater, your existing config notecard will **not** be overwritten. All current settings remain intact. If a newer version introduces additional options, you can manually add them to your config notecard. The updater will not remove or modify anything you have already configured.

---

## 13. Config Notecard

Right-click your UCC → **Edit** → **Content** tab → double-click `.config` to edit.

```
#settings 0/1 is off/on
sounds=1
soundradius=5
#animations to dress and undress
animations=1
#Use avatar specific outfits
avspec=1
# Friends of your friendlist have access
friends=1
# Everyone has access
everyone=0
#only someone sitting on the same object has access
sittersonly=0
#permit to access outfits
a_outfits=1
#permit to access avatars
a_avatars=0
#permit to access to addons
addons=0
#permit to access to avatar specific addons
av_addons=0
#permit to objects to control
api=1
# distance in meters
distance=10
#minimum age in days of a user to access
age=31
agecheck=1

#Use a default outfit when loading an avatar. The outfit needs to be marked with "_d"
defoutfit=1
#Want the default outfit to be public?
defpublic=0
#A timeout when someone loads an outfit or avatar. So your assets have time to load.
timeout=30

#List of users which are permitted or blocked to use your UCC. UUIDs separated by comma ","
accesswhitelist=uuid1,uuid2
accessblacklist=uuid3,uuid4

#lists to trigger animations
Larm=gloves,armwarmer,armwarmers,warmer
Lfeet=boots,stocking,heels,highheels,socks,leg,legs
Lhat=scarf,goggles,collar,glasses
Lupper=top,bra,shirt,croptop,jacket,dress,cardigan,pullover,sweater,sweatshirt,vest,corset,sleeve,sleeves,hoody,onesie,cuffs
Llower=panties,panty,undies,pants,jeans,jogger,skirt,shorts,hotpants,bottom,legcuffs

#List to exclude folders from hover change
hhExclude=jewels,socks,stocking,cuffs,legcuffs

#undress animations (animations need to be in the object)
undressupper=upper
undresslower=lower
undressfeet=undressfeet
undresshat=undresshat
undressarm=undressarm
#dress animations
dressupper=dressjacket
dresslower=dresspanties
dressfeet=dressfeet
dresshat=dresshat
dressarm=dressarm
#steal animation
cupper=cupper
clower=clower
#redress and changing
redress=redress

#Sounds UUID or Filename (files need to be in the object)
Supperundress=<uuid>
Slowerundress=<uuid>
Sfeetundress=<uuid>
Sundresshat=<uuid>
Sundressarm=<uuid>
Sredress=<uuid>

#Expressions remote for expression HUD
expressions=1
exChat=11
e_upper=OO
e_lower=OO
e_feet=:O
e_arms=OO
e_hat=OO

#blacklists for safesitter
#object1,object2,object3
blacklistobjects=ObjectName1,ObjectName2
#uuids only!
blacklistcreators=uuid1,uuid2
blacklistusers=uuid3,uuid4
whitelist=uuid5,uuid6
```

---

## 14. Additional Notecard Parameters

Coming soon.

---

## 15. Effects

Purchase an effect, place the effect prim in the correct folder, then use the included installer.

---

## 16. Installer

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

---

## 17. API / Creators

UCC listens on **channel 5100** and sends on **channel 5200**.

### API Commands (sent on ch. 5100)

| Command               | Action                        |
|-----------------------|-------------------------------|
| `outfit~nameofoutfit` | Load outfit                   |
| `avatar~nameofavatar` | Load avatar                   |
| `reload`              | Reload current outfit         |
| `callav`              | Responds with current avatar  |
| `callof`              | Responds with current outfit  |
| `naked`               | Loads naked layers            |
| `ping`                | Find users on a region        |

### Chat Commands

| Command         | Action                    |
|-----------------|---------------------------|
| `/77 main`      | Opens main menu           |
| `/77 clothing`  | Opens current outfit      |
| `/77 avatars`   | Opens avatars             |
| `/77 outfits`   | Opens outfits             |
| `/77 options`   | Opens options             |
| `/77 naked`     | Loads naked layers        |
| `/77 reload`    | Reloads current outfit    |

### API Listener Example (LSL)

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

### Plugin Example (LSL)

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

### Effect Example (LSL)

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

## 17. Frequently Asked Questions

**Q: It keeps spamming me with `@…` lines.**
A: Activate RLV! Or get a viewer that includes RLV.

**Q: Why do you make so many updates?**
A: The system is still growing and advancing. It's your loss if you do not update.

**Q: After updating the Maitreya body, my clothing doesn't fit?**
A: That's a Maitreya issue, not a UCC issue.

**Q: Why don't you offer it in Spanish/Portuguese/German/etc.?**
A: The main language used on the internet is English.

**Q: Why is this bug not fixed?**
A: Report it! Bugs can only be fixed when they are known.

**Q: Is this only for females?**
A: No. Anyone can use it. It's not gender-specific.

**Q: What makes this different from systems like OpenCollar?**
A: It's not comparable. With UCC, someone else can undress you — e.g. pull down your pants — and UCC replaces them with underwear, then makes you naked in the next stage.

**Q: Does it work with mesh?**
A: It works with anything you can wear — skin, layers, eyes, etc.

**Q: Does this change alpha layers on my mesh body?**
A: No. That would require access to all scripted channels of all mesh bodies. Many clothing items already include alpha functions.

**Q: Every time I change my avatar, the HUD detaches. How do I fix this?**
A: Don't put the HUD inside any of your `#RLV` folders or outfits!

**Q: Does RLV steal money from my account or read my IMs?**
A: No. RLV has no access to your account or IMs. That is a myth.

**Q: My BOM layers keep showing in the wrong order.**
A: That's an issue with Second Life's BOM system. Fix it by editing your worn outfit from the viewer's menu.

**Q: If I have one linked-together outfit, can I separately undress parts of it?**
A: No. They are one part and an outfit cannot be unlinked while wearing it.

---

## 18. Changelog

```
Version 2.04
* Complete code cleanup to increase performance even more
* Integrated a basic installer for folders
* Language of the most features except plugins can be changed
* No more website

```

> This changelog reflects the most recent updates to UCC. Older versions and legacy features may no longer be supported.

