// Plugin: Announce
// Announces outfit changes in local chat.
// Appears in: Plugins menu

string PLUGIN_NAME;
key    owner;
key    user;
integer listener;
integer dialogChan;
integer active;
string  tmpl;
string  menustate;

saveData()
{
    llLinksetDataWrite("announce_active", (string)active);
    llLinksetDataWrite("announce_tmpl",   tmpl);
}

loadData()
{
    active = (integer)llLinksetDataRead("announce_active");
    tmpl   = llLinksetDataRead("announce_tmpl");
    if (tmpl == "") tmpl = "Now wearing: {outfit}";
}

announce(string outfit)
{
    string avatar = llLinksetDataRead("myavatar");
    string text   = tmpl;
    text = llDumpList2String(llParseString2List(text, ["{outfit}"], []), outfit);
    text = llDumpList2String(llParseString2List(text, ["{avatar}"], []), avatar);
    llSay(0, text);
}

menu()
{
    llListenRemove(listener);
    dialogChan = -1 - (integer)llFrand(2000000000);
    listener   = llListen(dialogChan, "", user, "");
    menustate  = "main";
    string statusLine;
    if (active) statusLine = "✅ Active"; else statusLine = "❌ Inactive";
    llDialog(user,
        "Announce Plugin\n" +
        statusLine + "\n\n" +
        "Announces outfit changes in local chat.\n\n" +
        "Template: " + tmpl + "\n" +
        "({outfit} and {avatar} are replaced with current values)",
        ["Toggle", "Set Message", "Back"],
        dialogChan);
}

default
{
    state_entry()
    {
        PLUGIN_NAME = llList2String(llParseString2List(llGetScriptName(), ["."], []), 1);
        owner = llGetOwner();
        loadData();
    }
    attach(key u)
    {
        if (u != NULL_KEY) llResetScript();
    }
    changed(integer c)
    {
        if (c & CHANGED_OWNER) llResetScript();
    }
    link_message(integer link, integer chan, string msg, key id)
    {
        if (chan == 500 && msg == PLUGIN_NAME)
        {
            user = id;
            menu();
            return;
        }
        if (chan == 550 && (string)id == "outfit" && active)
        {
            announce(llLinksetDataRead("myoutfit"));
        }
    }
    listen(integer chan, string name, key id, string msg)
    {
        if (chan != dialogChan) return;
        if (msg == "Back")
        {
            llListenRemove(listener);
            llMessageLinked(LINK_SET, 500, "Plugins", id);
            return;
        }
        if (menustate == "main")
        {
            if (msg == "Toggle")
            {
                active = !active;
                saveData();
                menu();
            }
            else if (msg == "Set Message")
            {
                menustate = "setmsg";
                llTextBox(user,
                    "Enter announcement template.\n" +
                    "  {outfit} → current outfit name\n" +
                    "  {avatar} → current avatar name\n\n" +
                    "Current: " + tmpl,
                    dialogChan);
            }
        }
        else if (menustate == "setmsg")
        {
            string input = llStringTrim(msg, STRING_TRIM);
            if (input != "") tmpl = input;
            saveData();
            menu();
        }
    }
}
