# Hoverheight Control

To automatically adjust hover height, include a folder like:

```
stuff_0_0.100
```

---

## Dual Hover Height (since v1.94)

Two hover heights are supported based on your `.feet` notecard:

```
stuff_0_0.100_0.005
```

| Suffix   | Meaning                                                              |
|----------|----------------------------------------------------------------------|
| `_0`     | Item won't appear in the dialog                                      |
| `_0.100` | Sets hover height to **100mm above ground**                          |
| `_0.005` | Sets hover height to **5mm above ground** when undressing items from your `.lower` config |

---

## Activation

Enable via: **Plugins > Hoverheight**

> If you sit on an object or the ground, hover height resets to 0.

---

## Exclude from Hover Change

Folders listed in `hhExclude` in the `.conf` notecard will not trigger a hover height change:

```
hhExclude=jewels,socks,stocking,cuffs,legcuffs
```
