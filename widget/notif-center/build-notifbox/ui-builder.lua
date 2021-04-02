-- Formats and builds UI widgets like font, imagebox and actions
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local gears = require("gears")

local dpi = require("beautiful").xresources.apply_dpi
local clickable_container = require("widget.clickable-container")
local notification_icons = require("theme.icons").widget.notification

local ui_noti_builder = {}

-- Notification icon container
local notifbox_icon = function(ico_image)
  local noti_icon =
    wibox.widget {
    {
      id = "icon",
      resize = true,
      forced_height = dpi(25),
      forced_width = dpi(25),
      widget = wibox.widget.imagebox
    },
    layout = wibox.layout.fixed.horizontal
  }
  noti_icon.icon:set_image(ico_image)
  return noti_icon
end

-- Notification title container
local notifbox_title = function(title)
  return wibox.widget {
    markup = title,
    font = beautiful.font .. " 12",
    align = "left",
    valign = "center",
    widget = wibox.widget.textbox
  }
end

-- Notification message container
local notifbox_message = function(msg)
  return wibox.widget {
    markup = msg,
    font = beautiful.font .. " 11",
    align = "left",
    valign = "center",
    widget = wibox.widget.textbox
  }
end

-- Notification app name container
local notifbox_appname = function(app)
  return wibox.widget {
    markup = app,
    font = beautiful.font .. " 18",
    align = "left",
    valign = "center",
    widget = wibox.widget.textbox
  }
end

-- Notification actions container
local notifbox_actions = function(n)
  local actions_template =
    wibox.widget {
    notification = n,
    base_layout = wibox.widget {
      spacing = dpi(0),
      layout = wibox.layout.flex.horizontal
    },
    widget_template = {
      {
        {
          {
            {
              id = "text_role",
              font = beautiful.font .. " 10",
              widget = wibox.widget.textbox
            },
            widget = wibox.container.place
          },
          widget = clickable_container
        },
        bg = beautiful.transparent,
        shape = gears.shape.rounded_rect,
        forced_height = 30,
        widget = wibox.container.background
      },
      margins = 4,
      widget = wibox.container.margin
    },
    style = {underline_normal = false, underline_selected = true},
    widget = naughty.list.actions
  }

  return actions_template
end

-- Notification dismiss button
local notifbox_dismiss = function()
  local dismiss_imagebox =
    wibox.widget {
    {
      id = "dismiss_icon",
      image = notification_icons.delete,
      resize = true,
      forced_height = dpi(5),
      widget = wibox.widget.imagebox
    },
    layout = wibox.layout.fixed.horizontal
  }

  local dismiss_button =
    wibox.widget {
    {dismiss_imagebox, margins = dpi(5), widget = wibox.container.margin},
    widget = clickable_container
  }

  local notifbox_dismiss =
    wibox.widget {
    dismiss_button,
    visible = false,
    bg = beautiful.transparent,
    shape = gears.shape.circle,
    widget = wibox.container.background
  }

  return notifbox_dismiss
end

ui_noti_builder.notifbox_icon = notifbox_icon
ui_noti_builder.notifbox_title = notifbox_title
ui_noti_builder.notifbox_message = notifbox_message
ui_noti_builder.notifbox_appname = notifbox_appname
ui_noti_builder.notifbox_actions = notifbox_actions
ui_noti_builder.notifbox_dismiss = notifbox_dismiss

return ui_noti_builder
