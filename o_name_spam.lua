local spam = false
local counter = 0
ImGui.new_button("Misc", "Movement", "Change name", "chagename", function()
spam = true
end)
cheat.set_event_callback("on_paint", function()
if spam == true then
if counter >= 0 and counter < 20 then
cvar.revoke_callback(cvar.find_var("name"))
cvar.set_string(cvar.find_var("name"), "♛ ʟɪᴛᴇᴄᴏɪɴ ♛");
counter = counter + 1
elseif counter >= 20 and counter < 40 then
cvar.revoke_callback(cvar.find_var("name"))
cvar.set_string(cvar.find_var("name"), "♛ ʟɪᴛᴇᴄᴏɪɴ. ♛");
counter = counter + 1
elseif counter >= 40 and counter < 60 then
cvar.revoke_callback(cvar.find_var("name"))
cvar.set_string(cvar.find_var("name"), "♛ .ʟɪᴛᴇᴄᴏɪɴ ♛");
counter = counter + 1
elseif counter >= 60 and counter < 80 then
cvar.revoke_callback(cvar.find_var("name"))
cvar.set_string(cvar.find_var("name"), "♛ ʟɪᴛᴇᴄᴏɪɴ. ♛");
counter = counter + 1
elseif counter >= 80 and counter < 100 then
cvar.revoke_callback(cvar.find_var("name"))
cvar.set_string(cvar.find_var("name"), "♛ ʟɪᴛᴇᴄᴏɪɴ ♛");
counter = counter + 1
end
end
end)
