local screenx, screeny = engine.get_screen_size()
local function hsv_to_rgb(h, s, v, a)
local r, g, b

local i = math.floor(h * 6);
local f = h * 6 - i;
local p = v * (1 - s);
local q = v * (1 - f * s);
local t = v * (1 - (1 - f) * s);

i = i % 6

if i == 0 then r, g, b = v, t, p
elseif i == 1 then r, g, b = q, v, p
elseif i == 2 then r, g, b = p, v, t
elseif i == 3 then r, g, b = p, q, v
elseif i == 4 then r, g, b = t, p, v
elseif i == 5 then r, g, b = v, p, q
end

return r * 255, g * 255, b * 255, a * 255
end

local function func_rgb_rainbowize(frequency, rgb_split_ratio)
local r, g, b, a = hsv_to_rgb(globals.realtime() * frequency, 1, 1, 1)

r = r * rgb_split_ratio
g = g * rgb_split_ratio
b = b * rgb_split_ratio

return r, g, b
end

local function on_paint()

local r, g, b = func_rgb_rainbowize(0.1, 1)

local a = 255
surface.set_color(g, b, r, a)
surface.draw_filled_rect_fade(0, 0, screenx/2, 1, 255, 0, true)
surface.set_color(r, g, b, a)
surface.draw_filled_rect_fade(0, 0, screenx/2, 1, 0, 255, true)

surface.set_color(r, g, b, a)
surface.draw_filled_rect_fade(screenx/2, 0, screenx, 1, 255, 0, true)
surface.set_color(b, r, g, a)
surface.draw_filled_rect_fade(screenx/2, 0, screenx, 1, 0, 255, true)

local a_lower = a*0.5
surface.set_color(g, b, r, a)
surface.draw_filled_rect_fade(0, 1, screenx/2, 2, 255, 0, true)
surface.set_color(r, g, b, a)
surface.draw_filled_rect_fade(0, 1, screenx/2, 2, 0, 255, true)

surface.set_color(r, g, b, a)
surface.draw_filled_rect_fade(screenx/2, 1, screenx, 2, 255, 0, true)
surface.set_color(b, r, g, a)
surface.draw_filled_rect_fade(screenx/2, 1, screenx, 2, 0, 255, true)

end

cheat.set_event_callback("on_paint", on_paint)
