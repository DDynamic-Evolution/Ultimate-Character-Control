# Access Control

Access is controlled via the `.conf` notecard within UCC.

---

## Access Levels

| Level | Description |
|-------|-------------|
| **Owner Only** | Only the object owner has access |
| **Friends** | Owner and friends list |
| **Open Access** | Everyone can access |

---

## PIN Protection

You can lock your UCC with a PIN code to prevent unauthorized access via the menu.

1. Go to **Access** menu
2. Click **PIN**
3. Enter a numeric PIN code
4. From now on, anyone opening the menu must enter the correct PIN first

To remove the PIN:
1. Go to **Access** menu
2. Click **PIN**
3. Enter `0` to clear the PIN

The PIN is stored in LinksetData and persists across resets.

---

## Master System

You can grant full access to another avatar by setting them as **Master**:

1. Go to **Access** menu
2. Click **SET_MASTER**
3. Enter the 36-character UUID of the avatar
4. The master can now access your UCC with full permissions

To remove a master:
1. Go to **Access** menu
2. Click **REMOVE_MASTER**

The master UUID is stored in LinksetData and persists across resets.

---

## Managing Access Lists

- **Banned list**: Add UUIDs to `accessblacklist=` in `.conf`
- **Whitelist**: Add UUIDs to `accesswhitelist=` in `.conf`
- Click **LIST** in the Access menu to view current bans/whitelists

```
#List of users which are permitted or blocked to use your UCC. UUIDs separated by comma ","
accesswhitelist=uuid1,uuid2
accessblacklist=uuid3,uuid4
```

---

## Additional Config Options

```
# Friends of your friendlist have access
friends=1
# Everyone has access
everyone=0
# Only someone sitting on the same object has access
sittersonly=0
# Minimum age in days of a user to access
age=31
agecheck=1
# Permit access to specific features
a_outfits=1
a_avatars=0
addons=0
av_addons=0
api=1
# Distance in meters
distance=10
#set this to 1 if you like to have your current group to access your UCC (VERSION 2.06)
groupaccess=0
```
