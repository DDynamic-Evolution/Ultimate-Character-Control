// Example drain device for the UCC2 Battery plugin.
// Wear as attachment. Registers itself with the battery when active.
// The battery automatically drains DRAIN units every 5 seconds per registered device.
// Touch to toggle on/off.
//
// Drain reference (per 5s battery tick):
//   5   = same as idle base drain  (~48h extra drain)
//   30  = moderate                 (~8h extra drain)
//   60  = high                     (~4h extra drain)
//  120  = very high                (~2h extra drain)

integer API_IN   = 5100;
float   DRAIN    = 30.0;
string  DEV_NAME = "PowerDrain";

key     owner;
integer active = FALSE;

register()
{
    llRegionSayTo(owner, API_IN,
        "device_register~" + DEV_NAME + "~" + (string)((integer)DRAIN));
}

unregister()
{
    llRegionSayTo(owner, API_IN, "device_unregister~" + DEV_NAME);
}

updateText()
{
    if (active)
        llSetText("⚡ " + DEV_NAME + "\nActive", <1.0, 0.5, 0.0>, 1.0);
    else
        llSetText(DEV_NAME + "\nInactive", <0.5, 0.5, 0.5>, 0.8);
}

default
{
    state_entry()
    {
        owner = llGetOwner();
        updateText();
    }
    changed(integer c)
    {
        if (c & CHANGED_OWNER) llResetScript();
    }
    attach(key u)
    {
        if (u != NULL_KEY)
        {
            owner  = llGetOwner();
            active = TRUE;
            register();
            updateText();
            llOwnerSay("⚡ " + DEV_NAME + " connected – draining battery.");
        }
        else
        {
            if (active)
                unregister();
        }
    }
    touch_start(integer num)
    {
        if (llDetectedKey(0) != owner) return;
        active = !active;
        if (active)
        {
            register();
            llOwnerSay("⚡ " + DEV_NAME + " activated.");
        }
        else
        {
            unregister();
            llOwnerSay(DEV_NAME + " deactivated.");
        }
        updateText();
    }
}
