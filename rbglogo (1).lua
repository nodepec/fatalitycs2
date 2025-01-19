-- Fatality CS2 Rainbow Logo Script

-- Function to generate a rainbow color
local function get_rainbow_color(frequency, offset)
    local time = game.global_vars.real_time * frequency
    local r = math.sin(time + offset) * 127 + 128
    local g = math.sin(time + offset + 2) * 127 + 128
    local b = math.sin(time + offset + 4) * 127 + 128
    return draw.color(math.floor(r), math.floor(g), math.floor(b), 255)
end

-- Add the checkbox to enable/disable the rainbow logo
local rainbow_checkbox = gui.checkbox(gui.control_id("rainbow_logo_enabled"))
local rainbow_row = gui.make_control("Enable Rainbow Logo", rainbow_checkbox)

-- Add the row to the 'lua>elements a' group
local group = gui.ctx:find("lua>elements a")
assert(group, "[Rainbow Logo] Failed to locate 'lua>elements a' group.")
group:add(rainbow_row)

-- Function to draw the rainbow logo
local function draw_rainbow_logo()
    if not rainbow_checkbox:get_value():get() then return end

    local d = draw.surface
    d.font = draw.fonts["gui_title"]
    local rainbow_color = get_rainbow_color(2, 0) -- Frequency of 2, offset of 0
    d:add_text(draw.vec2(50, 50), "Fatality", rainbow_color)
end

-- Hook the drawing function
events.present_queue:add(draw_rainbow_logo)

-- Notify the script is loaded
print("[Rainbow Logo] Script loaded successfully.")
