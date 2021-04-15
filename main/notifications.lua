local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local helpers = require("main.helpers")

local icon_size = 60

naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(icon_size)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 8
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.position = "top_middle"

naughty.config.presets.normal = {
    font = beautiful.font .. ' 12',
    fg = beautiful.foreground,
    bg = beautiful.background
}

naughty.config.presets.low = {
    font = beautiful.font .. ' 13',
    fg = beautiful.foreground,
    bg = beautiful.background
}

---{{{ Notify when cpu temp rises above 65°C
awesome.connect_signal("signal::temp", function(temp)
    if temp > 65 then
        naughty.notify({title="[!] CPU is getting hot", text="Currently at " .. tostring(temp) .. "°C"})
    end
end)


naughty.connect_signal("request::display", function(n)
    n.timeout = 8
    local noti_icon = n.icon or n.app_icon
    local noti_title = n.title
    local noti_message = n.message
    naughty.layout.box {
        notification = n,
        type = "notification",
        bg = "alpha",
        widget_template = {
            {
                {
                    {
		       { -- left part with icon
			  {
                                {
                                    image = noti_icon,
                                    forced_height = icon_size,
                                    resize = true,
                                    clip_shape = helpers.squircle(10),
                                    widget = wibox.widget.imagebox
                                },
			     margins = dpi(8), -- between image and outter border
			     widget = wibox.container.margin
			  },
			  bg = beautiful.xcolor0,
			  widget = wibox.container.background
		       },
		       { -- right part with text
			  {
			     nil,
			     {
				{
				   markup = noti_title,
				   font = beautiful.font .. " 12",
				   widget = wibox.widget.textbox
				},
				{
				   markup = noti_message,
				   font = beautiful.font .. " 9",
				   widget = wibox.widget.textbox
				},
				layout = wibox.layout.fixed.vertical
			     },
			     naughty.list.actions,
			     layout = wibox.layout.align.vertical
			  },
			  margins = dpi(10),
			  shape = helpers.squircle(5),
			  bg = beautiful.xcolor1,
			  widget = wibox.container.margin
		       },
		       -- fill_space = true,
		       spacing = 4, -- between image box and text (added to the )
		       layout = wibox.layout.fixed.horizontal
                    },
                    id = "background_role",
                    widget = naughty.container.background
                },
                strategy = "max",
                width = 300,
                widget = wibox.container.constraint
            },
            shape = helpers.squircle(5),
            widget = wibox.container.background
	} -- end of widget_template
    }
end)

naughty.connect_signal("added", function(notification)
    if (notification.app_name and notification.app_name == "Brave") or (notification.clients[1] and notification.clients[1].class == "Brave-browser") then 
        naughty.destroy_all_notifications(awful.screen.focused(), naughty.notificationClosedReason.dismissedByUser)
    end
end)

