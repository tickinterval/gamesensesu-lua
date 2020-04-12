local font = surface.create_font("Verdana", 12, 400, 0, 144);
local screenx, screeny = engine.get_screen_size()
local username = "tickinterval"

function paint()
local stringdraw = "gamesense.su | " ..username .." | delay: " ..math.floor(engine.get_net_channel_info():get_avg_latency() * 1000) .."ms | " ..math.floor(1 / globals.tickinterval()).."tick"

surface.set_color(17, 17, 17, 180)
surface.draw_filled_rect(screenx - surface.get_text_size(font, stringdraw) - 12, 5, screenx - 5, 23)
surface.set_color(89, 119, 239, 255)
surface.draw_filled_rect(screenx - surface.get_text_size(font, stringdraw) - 12, 5, screenx - 5, 7)
surface.set_text_color(220, 220, 220, 220)
surface.set_text_pos(screenx - surface.get_text_size(font, stringdraw) - 8, 8)
surface.set_text_font(font);
surface.draw_text(stringdraw)
end
cheat.set_event_callback("on_paint", paint)
