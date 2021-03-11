local awful = require("awful")
local gears = require("gears")
local gcolor = require("gears.color")
local beautiful = require("beautiful")
local math = math

local mylayout = {}

mylayout.name = "horizontal"

function mylayout.arrange(p)
    local area = p.workarea
    local t = p.tag or screen[p.screen].selected_tag
    local mwfact = t.master_width_factor
    local nmaster = math.min(t.master_count, #p.clients)
    local nslaves = #p.clients - nmaster

    local master_area_height = area.height * mwfact
    local slave_area_height = area.height - master_area_height

    -- Special case: no slaves
    if nslaves == 0 then
        master_area_height = area.height
        slave_area_height = 0
    end

    -- Special case: no masters
    if nmaster == 0 then
        master_area_height = 0
        slave_area_height = area.height
    end

    -- itearte through masters
    for idx = 1, nmaster do
        local c = p.clients[idx]
        local g = {
            x = area.x + (idx - 1) * (area.width / nmaster),
            y = area.y,
            width = area.width / nmaster,
            height = master_area_height
        }
        p.geometries[c] = g
    end

    -- iterate through slaves
    for idx = 1, nslaves do
        local c = p.clients[idx + nmaster]
        local g = {
            x = area.x,
            y = area.y + master_area_height + (idx - 1) * (slave_area_height / nslaves),
            width = area.width,
            height = slave_area_height / nslaves
        }
        p.geometries[c] = g
    end
end

local icon_raw =
    gears.filesystem.get_configuration_dir() ..
    tostring(...):match("^.*bling"):gsub("%.", "/") .. "/icons/layouts/horizontal.png"

local function get_icon()
    if icon_raw ~= nil then
        return gcolor.recolor_image(icon_raw, beautiful.fg_normal)
    else
        return nil
    end
end

return {
    layout = mylayout,
    icon_raw = icon_raw,
    get_icon = get_icon
}
