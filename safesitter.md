# SafeSitter

SafeSitter is a specialized script that monitors avatars sitting on the same object as you. If someone matches a ban list, wears flagged items, or uses content from creators you choose not to support, SafeSitter will automatically react.

Configure blacklisted items, people, and creators from the notecards within UCC (look for notecards with `blacklist` and `whitelist` in the name).

---

## Core Functionality

- Scans co-sitters in real time
- Detects banned avatars or worn items
- Identifies blacklisted creators
- Forces you to stand and re-sit once the flagged avatar leaves the scan area

---

## Why SafeSitter?

- Maintain control over shared seating
- Avoid unwanted interactions
- Enforce personal or community standards

SafeSitter runs silently and efficiently in the background.

---

## Configuration

Set blacklists in the `.conf` notecard:

```
#blacklists for safesitter
#object1,object2,object3
blacklistobjects=ObjectName1,ObjectName2
#uuids only!
blacklistcreators=uuid1,uuid2
blacklistusers=uuid3,uuid4
whitelist=uuid5,uuid6
```
