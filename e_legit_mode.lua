ImGui.new_checkbox("RAGE", "Aimbot","Auto Wall HotKey", "rage_automaticpenetration1")
ImGui.new_keybind("RAGE", "Aimbot","##Auto Wall HotKey", "Automatic_Penetration")

ImGui.new_checkbox("AA", "Anti-aimbot angles","LegitAA", "legit_aa")
ImGui.new_keybind("AA", "Anti-aimbot angles","##LegitAA", "legit_aa_key")
local screenx, screeny = engine.get_screen_size()
local font = surface.create_font("Verdana", 26, 700, 0, 144);


function paint()
if not engine.is_in_game() or not engine.is_connected() then
	return
end
local autowall = config.get("rage_automaticpenetration1")
if autowall and ImGui.is_bind_active("Automatic_Penetration") then
	config.set("rage_automaticpenetration", true) 
	surface.indicator("AW", 123, 195, 21, 255)
else
	config.set("rage_automaticpenetration", false) 
	surface.indicator("AW", 255, 0, 0, 255)
end

if config.get("aa_enabled") then

local legitaa = config.get("legit_aa")
if legitaa and ImGui.is_bind_active("legit_aa_key") then
	config.set("rage_antiaim_yaw_custom", 180)
	config.set("rage_antiaim_yaw_desync_custom", 180) 
	surface.indicator("RIGHT", 123, 195, 21, 255)
	surface.set_text_color(255, 255, 255, 255)
	surface.set_text_pos(screenx / 2 + 26, screeny / 2 - 15) 
	surface.set_text_font(font);
	surface.draw_text("⮚")
else
	config.set("rage_antiaim_yaw_custom", -180)
	config.set("rage_antiaim_yaw_desync_custom", -180) 
	surface.indicator("LEFT", 123, 195, 21, 255)
	surface.set_text_color(255, 255, 255, 255)
	surface.set_text_pos(screenx / 2 - 36, screeny / 2 - 15) 
	surface.set_text_font(font);
	surface.draw_text("⮘")
end
end

local ragebot_enabled = config.get("rage_aimbot")
if ragebot_enabled and ImGui.is_bind_active("rage_aimbot_key") then
	surface.indicator("MT", 123, 195, 21, 255)
else
	surface.indicator("MT", 255, 0, 0, 255)
end

local forcebody = config.get("rage_forcebaim")
if ragebot_enabled and ImGui.is_bind_active("rage_forcebaim_key") then
	surface.indicator("FB", 123, 195, 21, 255)
else
	surface.indicator("FB", 255, 0, 0, 255)
end

surface.indicator("FOV: "..config.get("rage_fov"), 255, 0, 0, 255)

end
cheat.set_event_callback("on_paint", paint)
