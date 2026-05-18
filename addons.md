# Addons & AvAddons

> **Addons and AvAddons do NOT autoapply with your avatar and outfit!**

---

## Addons

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

---

## AvAddons

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

---

## Default-On Items

Append `_d` to an item folder name to mark it as the default for that category. It will auto-attach whenever that avatar is loaded — no manual selection needed.

```
av_addons/Luna/wings/fairy_wings_d/   ← auto-attaches when Luna loads
av_addons/Luna/wings/demon_wings/     ← manual only
```

Multiple items in different categories can each have `_d`. If you later want a different variant as default, rename the old folder (remove `_d`) and add `_d` to the new one.

---

## Examples

- Global HUD: `#RLV/~undressify/addon/HUDs/gestureHUD/`
- Avatar-specific toy: `#RLV/~undressify/av_addons/avatarname/Toys/bubblewand/`

> All addon folders must be created **manually**.

---

## Notes (since v1.63)

- Selecting a different subfolder within the same category will automatically remove other items in that category.
- To **hide** any addon folder from the menu, add `*` to the end of the folder name.

Manage Addons via the **Options** menu.
