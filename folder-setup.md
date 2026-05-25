# Avatar Folder Setup

> **!! NEVER KEEP THE TOOL WITHIN YOUR `~undressify` FOLDER !!**
> Doing so will cause the tool to be detached when you change avatars.

You must create the folder structure manually. This structure is essential for UCC to function properly.

---

## Required Folder Structure

**Avatar folder:**
```
#RLV
└──~undressify
    └──av
        └──youravatarname
```

Place your naked avatar into this folder. You can have multiple avatar folders. Load an avatar using the **Avatar** button.

---

## Outfit Folder

You can organize outfits per avatar by enabling **avatar-specific mode** (`avspecific`).

```
#RLV
└──~undressify
    └──of_avatarname
        └── nameofyouroutfit
            ├── top_1
            ├── pants_1
            ├── top_2
            ├── pants_2
            ├── top_3
            ├── pants_3
            └── top_0 / pants_0 (optional)
```

---

## Folder Layer Meanings

Layers are restricted to three (3). Each folder suffix defines how the clothing behaves during undressing.

| Folder Suffix | Meaning                   | Notes                                          |
|---------------|---------------------------|------------------------------------------------|
| `_1`          | Top layer                 | Visible clothing                               |
| `_2`          | Underwear / secondary     | Optional                                       |
| `_3`          | Naked layer or extras     | Optional, requires `_2` to be present          |
| `_0`          | Hidden layer              | Inaccessible to others (e.g. tattoos, details) |

> Outfits with `*` in their name are only visible to you.

---

## Default Outfit (v1.99+)

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

---

## How to Use

1. Load an outfit using the **Outfits** button.
2. The **Clothing** button will appear next.
3. Click the **Clothing** button to preview how your clothing will be undressed.
4. Click your **belly** or **lower back** to open the menu and load your avatar, outfit, etc.
5. Go to the main menu and click **"outfit"** to begin.

---

## Complete Example Folder Layout

```
#RLV/
└── ~undressify
    ├── addon
    │   ├── HUDs
    │   │   ├── gestureHUD
    │   │   └── AOcontroller
    │   ├── Accessories
    │   │   ├── smartGlasses
    │   │   └── wristwatch
    │   └── Scripts
    │       └── autoSit
    │
    ├── effects
    │   └── effectname
    │
    ├── av_addons
    │   ├── Luna
    │   │   ├── Toys
    │   │   │   ├── bubblewand
    │   │   │   └── leash
    │   │   ├── HUDs
    │   │   │   └── lunaHUD
    │   │   └── Accessories
    │   │       └── collar
    │   └── Rex
    │      ├── Gear
    │      │   ├── combatVest
    │      │   └── scanner
    │      └── HUDs
    │          └── rexHUD
    │
    ├── av
    │   ├── Luna
    │   └── Rex
    │
    └── of
        └── CasualLook
            ├── top_1
            ├── pants_1
            ├── top_2
            ├── pants_2
            ├── top_3
            ├── pants_3
            ├── base_0
            └── stuff_0_0.100   ← optional item with hover height control
```

**Tips:**
- The folder under `of/` is your outfit name (e.g. `CasualLook`)
- Items use suffixes like `_1`, `_2`, `_3` to define layer priority
- Items with `_0` are optional base layers
- Append `_0.100`, `_0.050`, etc. to an item name to control avatar hover height (see [Hoverheight](hoverheight.md))
