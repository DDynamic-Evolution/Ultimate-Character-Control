# Sounds & Animations

## Sounds

**Sounds** correspond to folder names. A folder named `top_1` will play the sound named `top`.

Place custom sound files inside the UCC object to override defaults.

---

## Animations

**Animations** follow the same logic. A folder named `pants_2` will trigger the animation named `pants`.

---

## Config

Animation and sound names are configured in the `.conf` notecard:

```
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
```

The lists that map folder names to animation categories are also set in `.conf`:

```
Larm=gloves,armwarmer,armwarmers,warmer
Lfeet=boots,stocking,heels,highheels,socks,leg,legs
Lhat=scarf,goggles,collar,glasses
Lupper=top,bra,shirt,croptop,jacket,dress,cardigan,pullover,sweater,sweatshirt,vest,corset,sleeve,sleeves,hoody,onesie,cuffs
Llower=panties,panty,undies,pants,jeans,jogger,skirt,shorts,hotpants,bottom,legcuffs
```

See [Config Notecard](config.md) for the full list of parameters.
