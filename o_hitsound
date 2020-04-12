ImGui.new_checkbox("Visuals", "Player ESP", "Custom Hit market sound", "customhitmarker")
cheat.set_event_callback("player_hurt", function(e) 

if config.get("customhitmarker") then
if engine.get_player_for_user_id(e:get_int("attacker")) == engine.get_local_player_index() then
   engine.client_cmd_unrestricted("play hitsound")
end
end
end)
