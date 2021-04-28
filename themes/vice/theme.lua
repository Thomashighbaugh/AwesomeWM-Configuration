local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir () .. "themes/vice/"
local theme = {}
theme.font = "TerminessTTF Nerd Font 12"
theme.font_bold = "TerminessTTF Nerd Font Mono 12"
theme.font_large = "TerminessTTF Nerd Font Mono 16"
theme.font_small =  "TerminessTTF Nerd Font 11"
theme.font_extra_small =  "TerminessTTF Nerd Font 9"

-- Load ~/.Xresources colors and set fallback colors
theme.xbackground = xrdb.background
theme.background = xrdb.background
theme.xforeground = xrdb.foreground
theme.foreground = xrdb.foreground
theme.xcolor0 = xrdb.color0
theme.xcolor1 = xrdb.color1
theme.xcolor2 = xrdb.color2
theme.xcolor3 = xrdb.color3
theme.xcolor4 = xrdb.color4
theme.xcolor5 = xrdb.color5
theme.xcolor6 = xrdb.color6
theme.xcolor7 = xrdb.color7
theme.xcolor8 = xrdb.color8
theme.xcolor9 = xrdb.color9
theme.xcolor10 = xrdb.color10
theme.xcolor11 = xrdb.color11
theme.xcolor12 = xrdb.color12
theme.xcolor13 = xrdb.color13
theme.xcolor14 = xrdb.color14
theme.xcolor15 = xrdb.color15
theme.xcolor16 = "#555e70" 
theme.xcolor17 = "#b2bfd9"
theme.xcolor18 = "#22262d"

theme.bg_normal     = theme.background 
theme.bg_focus      = theme.xcolor8 
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.xcolor18 
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.xcolor17
theme.fg_focus      = theme.xcolor15
theme.fg_urgent     = theme.foreground
theme.fg_minimize   = theme.foreground

-- button colors
theme.bg_button = theme.xbackground
theme.border_button = theme.xcolor0
theme.button_active = theme.color5
theme.button_active_alt = theme.xcolor4

theme.useless_gap   = dpi(1)
theme.gap_single_client = false
theme.maximized_hide_border = true
theme.border_width  = dpi(1)
theme.border_normal = theme.xcolor18
theme.border_focus  = theme.xcolor18
theme.border_marked = theme.xcolor8

-- widget bg colors
theme.bg_widget = theme.xcolor0

-- Margins and paddings and border width
theme.notification_margin = dpi(6)
theme.widget_margin = dpi(6)
theme.btn_xs_margin = dpi(3)
theme.btn_md_margin = dpi(5)
theme.btn_border_width = dpi(1)
theme.widget_border_width = dpi(1)
theme.widget_margin = dpi(6)
theme.is_enable_titlebar = true
-- shapes
theme.btn_xs_shape = function (cr, height, width)
    gears.shape.rounded_rect(cr, height, width, 2)
end

theme.btn_lg_shape = function (cr, height, width)
    gears.shape.rounded_rect(cr, height, width, 4)
end

theme.widget_shape = function (cr, height, width)
    gears.shape.rounded_rect(cr, height, width, 4)
end
theme.panel_button_shape = function (cr, height, width)
    gears.shape.rounded_rect(cr, height, width, 1)
end

-- Icons
theme.icon_times = themes_path .. "icons/remove.svg"
-- awesome icon 
theme.awesome_menu_icon = themes_path .. "icons/logo.svg"
--- Update toggle icons
theme.icon_update_none = themes_path .. "icons/update-none.svg"
theme.icon_update_available = themes_path .."icons/update-low.svg"
--- Previous and Next icon
theme.icon_previous = themes_path .. "icons/go-previous.svg"
theme.icon_next = themes_path .. "icons/go-next.svg"

theme.icon_focus_mode = themes_path .. "icons/focus-mode.svg"

theme.brightness_icon = themes_path .. "icons/brightness.svg"

theme.battery_icon = themes_path .. "icons/battery/battery-normal.svg"
theme.volume_normal_icon = themes_path .. "icons/volume/audio-volume-high.svg"
theme.volume_muted_icon = themes_path .. "icons/volume/audio-volume-muted.svg"

theme.wireless_connected_icon = themes_path .. "icons/network-wireless-connected.svg"
theme.wireless_disconnected_icon = themes_path .. "icons/network-wireless-disconnected.svg"
theme.wired_connected_icon = themes_path .. "icons/network-wired-activated.svg"
theme.wired_disconnected_icon = themes_path .. "icons/network-wired-unavailable.svg"

theme.arrow_left_icon = themes_path .. "icons/go-previous.svg"
theme.arrow_right_icon = themes_path .. "icons/go-next.svg"
theme.icon_terminal = themes_path .. "icons/utilities-terminal.svg"

theme.icon_bluetooth = themes_path .. "icons/network-bluetooth.svg"
theme.icon_empty_notibox = themes_path .. "icons/mail-receive.svg"
theme.icon_clear_all = themes_path .. "icons/clear-all.svg"
theme.icon_camera = themes_path .. "icons/camera-photo.svg"
theme.icon_mic = themes_path .. "icons/audio-input-microphone.svg"
theme.icon_airplane = themes_path .. "icons/airplane-mode.svg"

theme.icon_system_power_off = themes_path .. "icons/system/system-shutdown.svg"
theme.icon_system_restart = themes_path .. "icons/system/system-restart.svg" 
theme.icon_system_sleep = themes_path .. "icons/system/system-suspend.svg"
theme.icon_system_screen_lock = themes_path .. "icons/system/system-lock-screen.svg"
theme.icon_system_logout = themes_path .. "icons/system/system-log-out.svg"
theme.face_image = themes_path .. "icons/system/default.png"

theme.icon_bell = themes_path .. "icons/notifications.svg"
theme.icon_lock = themes_path .. "icons/lock.svg"
theme.icon_redshift = themes_path .. "icons/redshift-status-on.svg"

theme.icon_floating = themes_path .. "layouts/floating.svg"



-- Icons for notifications
theme.icon_screenhost_taken = themes_path .. "icons/64x64/camera-photo.svg"
theme.icon_noti_error = themes_path .. "icons/48x48/dialog-error.svg"
theme.icon_noti_info = themes_path .. "icons/48x48/dialog-information.svg"
theme.icon_bat_caution = themes_path .. "icons/48x48/battery-caution.svg"
-- Taglist
--- Generate taglist squares:
local taglist_square_size = dpi(8)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_bg_focus = theme.border_button
theme.taglist_spacing     = 4
theme.taglist_fg_focus = theme.xcolor15

theme.taglist_fg_urgent = theme.xcolor1

theme.taglist_fg_occupied = theme.xforeground

theme.taglist_fg_empty = theme.xcolor8

theme.taglist_fg_volatile = theme.xcolor11

-- Tasklist
theme.tasklist_shape  = function (cr, height, width)
    gears.shape.rounded_rect(cr, height, width, 6)
end
theme.tasklist_shape_border_width = dpi(1)
theme.tasklist_shape_border_color = theme.border_button
theme.tasklist_bg_focus = theme.bg_normal
theme.tasklist_bg_normal = theme.bg_button


-- Snap area
theme.snap_bg = theme.bg_button
theme.snap_shape = function (cr, height, width)
    gears.shape.rounded_rect(cr, height, width, 8)
end
theme.snap_border_width = dpi(3)
theme.snapper_gap = dpi(3)


-- Notification
theme.notification_font = theme.font
theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_shape = function(cr, width, height) 
    gears.shape.rounded_rect(cr, width, height, 6) 
end
theme.notification_width = dpi(465)
theme.notification_max_width = dpi(465)
theme.notification_icon_size = 64
theme.notification_spacing = dpi(8)
theme.notification_border_width = 0;
--theme.notification_border_color  = theme.border_normal


-- systray
theme.bg_systray = theme.bg_normal

-- Menu
theme.menu_submenu_icon = themes_path.."/submenu.png"
theme.menu_height = dpi(24)
theme.menu_width  = dpi(200)

-- Wibar
theme.wibar_height = dpi(26)
theme.wibar_position = "bottom"

-- Titlebar
--- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "/titlebar/window-close-normal.svg"
theme.titlebar_close_button_focus  = themes_path .. "/titlebar/window-close.svg"

theme.titlebar_minimize_button_normal = themes_path .. "/titlebar/go-down.svg"
theme.titlebar_minimize_button_focus  = themes_path .. "/titlebar/go-down.svg"


theme.titlebar_sticky_button_normal_inactive = themes_path.."/titlebar/window-pin.svg"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."/titlebar/window-pin.svg"
theme.titlebar_sticky_button_normal_active = themes_path.."/titlebar/window-pin.svg"
theme.titlebar_sticky_button_focus_active  = themes_path.."/titlebar/window-pin.svg"


theme.titlebar_maximized_button_normal_inactive = themes_path.."/titlebar/go-up.svg"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."/titlebar/go-up.svg"
theme.titlebar_maximized_button_normal_active = themes_path.."/titlebar/go-up.svg"
theme.titlebar_maximized_button_focus_active  = themes_path.."/titlebar/go-up.svg"
theme.titlebar_bg_focus = theme.bg_normal


theme.wallpaper = themes_path.."/background.png"

-- LayoutBox
--- You can use your own layout icons like this:
theme.layout_floating  = themes_path.."layouts/floating.svg"
theme.layout_max = themes_path.."layouts/max.svg"
theme.layout_fullscreen = themes_path.."layouts/fullscreen.svg"
theme.layout_tile = themes_path.."layouts/tile.svg"
theme.layout_dwindle = themes_path.."layouts/dwindle.svg"


-- Hotkey popup
theme.hotkeys_border_width = dpi(1)
theme.hotkeys_border_color = theme.bg_normal
theme.hotkeys_modifiers_fg = theme.button_active_alt
theme.hotkeys_shape = gears.shape.rounded_rect

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)
theme.taglist_font = "awesomewm-font 15"
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.

theme.icon_theme = "Chhinamasta"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
