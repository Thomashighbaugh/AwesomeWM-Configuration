local gears = require("gears")
local beautiful = require("beautiful")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local _, package_path = ...
if not package_path then
    package_path = string.sub(debug.getinfo(1, "S").source, 2)
end
local theme_dir = package_path:match("(.*/)")

local titlebar_theme = "stoplight"
local titlebar_icon_path = theme_dir .. "/icons/titlebar/" .. titlebar_theme .. "/"
local tip = titlebar_icon_path

local theme = {}
theme.icons = theme_dir .. "/icons/"
require("theme.icons")
-- ========================================================================
--  Xresources Color Import
-- ========================================================================
theme.xbackground = xrdb.background
theme.xforeground = xrdb.foreground
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

-- Font
theme.font = "Encode Sans SemiExpanded ExtraBold"
theme.font_bold = theme.font
theme.font_heavy = theme.font .. " 18"
-- Noto Sans Grantha
-- Menu icon theme
-- theme.icon_theme = 'breeze'

theme.dir = theme_dir

theme.icons = theme.dir .. "/icons/"
theme.accent = theme.xcolor15

theme.accent = theme.xcolor4
-- Foreground

theme.title_font = theme.font .. " 14"

theme.fg_normal = theme.xforeground
theme.fg_focus = theme.xcolor7
theme.fg_urgent = theme.xcolor1

theme.bat_fg_critical = theme.xcolor1
theme.background = theme.xbackground
theme.bg_normal = theme.background
theme.bg_focus = theme.xcolor0
theme.bg_urgent = theme.xcolor8

theme.margin_size = dpi(0)
theme.margin_hover_diff = dpi(2)
theme.transparent = theme.xbackground .. "00"

-- System tray

theme.bg_systray = theme.background
theme.systray_icon_spacing = dpi(9)

-- Titlebar

theme.titlebar_size = dpi(24)
theme.titlebar_button_margin = dpi(0)
theme.titlebar_button_spacing = dpi(6)
theme.titlebar_pos = "top"
theme.titlebar_button_pos = "right"
theme.titlebar_enabled = true
theme.border_width = dpi(0)
theme.wibar_border_width = dpi(0)
theme.titlebar_radius = dpi(0)
theme.titlebar_bg_focus = theme.xbackground .. "cc"
theme.titlebar_bg_normal = theme.xbackground .. "aa"
theme.titlebar_fg_focus = theme.xforeground .. "ff"
theme.titlebar_fg_normal = theme.xforeground .. "ff"

-- UI Groups

theme.groups_title_bg = theme.xbackground
theme.groups_bg = theme.xcolor6
theme.groups_radius = dpi(2)

-- Client Decorations

-- Borders
if theme.titlebar_enabled then
    theme.border_focus = theme.xcolor6 .. "cc"
else
    theme.border_focus = theme.xcolor8 .. "30"
end
theme.border_normal = theme.background
theme.border_marked = theme.xcolor1
theme.border_radius = dpi(13)

-- Decorations
theme.client_radius = dpi(12)
theme.useless_gap = dpi(2)

-- Menu
theme.menu_font = theme.font .. " 11"
theme.menu_submenu = "➤"

theme.menu_height = dpi(24)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(12)

theme.menu_bg_normal = theme.xbackground .. "cc"
theme.menu_fg_normal = theme.xforeground
theme.menu_fg_focus = theme.xforeground
theme.menu_bg_focus = theme.accent
theme.menu_border_color = theme.xcolor8 .. "66"

-- Tooltips

theme.tooltip_bg = theme.background
theme.tooltip_border_color = theme.transparent
theme.tooltip_border_width = 0
theme.tooltip_gaps = dpi(5)
theme.tooltip_shape = function(cr, w, h)
    gears.shape.rectangle(cr, w, h)
end

-- Separators

theme.separator_color = theme.color7

-- Layoutbox icons

theme.layout_max = theme.icons .. "layouts/max.png"
theme.layout_tile = theme.icons .. "layouts/tile.svg"
theme.layout_tilebottom = theme.icons .. "layouts/tilebottom.svg"
theme.layout_dwindle = theme.icons .. "layouts/dwindle.png"
theme.layout_floating = theme.icons .. "layouts/floating.png"
theme.layout_fairh = theme.icons .. "layouts/fairh.png"
theme.layout_mstab = theme.icons .. "layouts/mstab.png"

-- Taglist

theme.taglist_spacing = dpi(10)
theme.taglist_bg = theme.transparent
theme.taglist_bg_focus = theme.transparent
theme.taglist_fg_focus = theme.xcolor7
theme.taglist_bg_urgent = theme.transparent
theme.taglist_fg_urgent = theme.xcolor1
theme.taglist_bg_occupied = theme.transparent
theme.taglist_fg_occupied = theme.xcolor7
theme.taglist_bg_empty = theme.transparent
theme.taglist_fg_empty = theme.xforeground
theme.taglist_bg_volatile = theme.transparent
theme.taglist_fg_volatile = theme.xcolor11
theme.taglist_disable_icon = true

-- Tasklist

theme.tasklist_font = theme.font .. " 10"
theme.tasklist_fg_minimize = theme.color8
theme.tasklist_bg_normal = theme.xbackground
theme.tasklist_bg_urgent = theme.xbackground

theme.tasklist_fg_focus = theme.xcolor15
theme.tasklist_fg_urgent = theme.xcolor1
theme.tasklist_fg_normal = theme.xforeground

-- Popup
theme.popup_bg = theme.xbackground .. "dd"

-- Notification

theme.notification_bg1 = theme.xbackground .. "dd"
theme.notification_bg2 = theme.xbackground .. "dd"
theme.notification_position = "top_left"
theme.notification_bg = theme.background
theme.notification_margin = theme.useless_gap
theme.notification_type = "notification" -- use "dock" for no blur "notification" for blur
theme.notification_border_width = dpi(0)
theme.notification_border_color = theme.xbackground .. "bb"
theme.notification_spacing = dpi(0)
theme.notification_icon_resize_strategy = "center"
theme.notification_icon_size = dpi(70)
_G.dont_disturb = true

-- Client Snap Theme

theme.snap_bg = theme.background
theme.snap_shape = gears.shape.rounded_rect
theme.snap_border_width = dpi(15)

-- Hotkey popup

theme.hotkeys_font = theme.font .. " 14"
theme.hotkeys_description_font = theme.font .. " 16"
theme.hotkeys_bg = theme.background
theme.hotkeys_group_margin = dpi(20)

-- Main panel
theme.panel_height = 46
theme.panel_width = 560
theme.panel_desktop_width = 560
theme.panel_laptop_width = 560
theme.panel_bg = theme.xbackground .. "dd"
theme.panel_radius = dpi(12)
theme.panel_widget_border_width = dpi(0)
theme.panel_widget_border_color = theme.xbackground .. "dd"
theme.panel_widget_bg_color = theme.transparent
theme.panel_widget_radius = dpi(12)
theme.panel_padding = dpi(0)
theme.panel_blur_type = "panel" -- use "dock" for no blur, "panel" for blur

-- Second small panel
-- small heigt meeans the increase call back is necessary so one can read it
theme.small_panel_height = 24
theme.small_panel_width = 1920
theme.small_panel_radius = dpi(0)
theme.small_panel_desktop_width = 1920
theme.small_panel_laptop_width = 1920
theme.small_panel_bg = theme.xbackground .. "cc"
theme.small_panel_radius = dpi(0)
theme.small_panel_widget_border_width = 0
theme.small_panel_widget_border_color = theme.transparent
theme.small_panel_widget_bg_color = theme.transparent
theme.small_panel_widget_radius = dpi(0)
theme.small_panel_padding = dpi(2)
theme.small_panel_blur_type = "dock" -- use "dock" for no blur, "panel" for blur

-- Popup

-- ===================================================================
-- Bling Specific ---------------------------------------------------
-- ===================================================================
-- window swallowing
theme.dont_swallow_classname_list = {"firefox", "firefox-nightly", "Gimp"} -- list of class names that should not be swallowed
theme.dont_swallow_filter_activated = true -- whether the filter above should be active

-- flash focus
theme.flash_focus_start_opacity = 0.36 -- the starting opacity
theme.flash_focus_step = 0.13 -- the step of animation

-- tabbed
theme.tabbed_spawn_in_tab = true -- whether a new client should spawn into the focused tabbing container

-- tabbar general
theme.tabbar_ontop = false
theme.tabbar_radius = dpi(3) -- border radius of the tabbar
theme.tabbar_style = "modern" -- style of the tabbar ("default", "boxes" or "modern")
theme.tabbar_font = theme.font .. " 12" -- font of the tabbar
theme.tabbar_size = 25 -- size of the tabbar
theme.tabbar_position = "top" -- position of the tabbar
theme.tabbar_bg_normal = theme.xbackground .. "aa" -- background color of the focused client on the tabbar
theme.tabbar_fg_normal = theme.xforeground -- foreground color of the focused client on the tabbar
theme.tabbar_bg_focus = theme.xbackground .. "00" -- background color of unfocused clients on the tabbar
theme.tabbar_fg_focus = theme.xcolor6 -- foreground color of unfocused clients on the tabbar

-- mstab
theme.mstab_bar_ontop = false -- whether you want to allow the bar to be ontop of clients
theme.mstab_dont_resize_slaves = true -- whether the tabbed stack windows should be smaller than the
-- currently focused stack window (set it to true if you use
-- transparent terminals. False if you use shadows on solid ones
theme.mstab_bar_padding = dpi(0) -- how much padding there should be between clients and your tabbar
-- by default it will adjust based on your useless gaps.
-- If you want a custom value. Set it to the number of pixels (int)
theme.mstab_border_radius = dpi(6) -- border radius of the tabbar
theme.mstab_bar_height = 25 -- height of the tabbar
theme.mstab_tabbar_position = "top" -- position of the tabbar (mstab currently does not support left,right)
theme.mstab_tabbar_style = "modern" -- style of the tabbar ("default", "boxes" or "modern")
-- defaults to the tabbar_style so only change if you want a
-- different style for mstab and tabbed

-- the following variables are currently only for the "modern" tabbar style
theme.tabbar_color_close = theme.xcolor1 -- changes the color of the close button
theme.tabbar_color_min = theme.xcolor4 -- changes the color of the minimize button
theme.tabbar_color_float = theme.xcolor6 -- changes the color of the float button

theme.osd_width = dpi(350)
theme.osd_height = dpi(200)

-- ==============================================================================
-- Titlebar Icons
-- ==============================================================================

theme.titlebar_close_button_normal = tip .. "close_normal.svg"
theme.titlebar_close_button_focus = tip .. "close_focus.svg"

theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus = tip .. "minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive = tip .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active = tip .. "ontop_focus_active.svg"

theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive = tip .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active = tip .. "sticky_focus_active.svg"

theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive = tip .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active = tip .. "floating_focus_active.svg"

theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive = tip .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active = tip .. "maximized_focus_active.svg"
theme.titlebar_close_button_normal = tip .. "close_normal.svg"
theme.titlebar_close_button_focus = tip .. "close_focus.svg"

theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover = tip .. "minimize_focus_hover.svg"

theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover = tip .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover = tip .. "ontop_focus_active_hover.svg"

theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover = tip .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover = tip .. "sticky_focus_active_hover.svg"

theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover = tip .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover = tip .. "floating_focus_active_hover.svg"

theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover = tip .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover = tip .. "maximized_focus_active_hover.svg"

-- ====================================================================================
-- Tagbar font (putting anywhere logical broke the config)
-- ====================================================================================
theme.taglist_font = "awesomewm-font 30"

return theme
