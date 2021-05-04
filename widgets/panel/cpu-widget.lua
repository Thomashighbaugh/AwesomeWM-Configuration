-- ###########################################################
--  ______ ______ _______      ________ _______ _____  _______ _______ _______
-- |      |   __ \   |   |    |  |  |  |_     _|     \|     __|    ___|_     _|
-- |   ---|    __/   |   |    |  |  |  |_|   |_|  --  |    |  |    ___| |   |
-- |______|___|  |_______|    |________|_______|_____/|_______|_______| |___|

-- Inspired by:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/cpu-widget
-- @author Pavel Makhov

-------------------------------------------------

local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local vicious = require("external.lib.vicious")
local dpi = beautiful.xresources.apply_dpi

-- ###########################################################
-- cpu widget with resource monitor from lain
local cpu = wibox.widget.textbox()
vicious.cache(vicious.widgets.cpu)
vicious.register(cpu, vicious.widgets.cpu, "$1%", 4)
cpu.font = beautiful.font .. " 14"

-- ###########################################################
-- bash command from which figures are derived
local CMD =
    [[sh -c "grep '^cpu.' /proc/stat; ps -eo '%p|%c|%C|' -o "%mem" -o '|%a' --sort=-%cpu ]] ..
    [[| head -11 | tail -n +2"]]

-- ###########################################################

local HOME_DIR = os.getenv("HOME")
local WIDGET_DIR = HOME_DIR .. "/.config/awesome/awesome-wm-widgets/cpu-widget"

local cpu_widget = {}
local cpu_rows = {
    spacing = 0,
    layout = wibox.layout.fixed.vertical
}
local is_update = true
local process_rows = {
    layout = wibox.layout.fixed.vertical
}
-- ###########################################################
-- Splits the string by separator
-- @return table with separated substrings
local function split(string_to_split, separator)
    if separator == nil then
        separator = "%s"
    end
    local t = {}

    for str in string.gmatch(string_to_split, "([^" .. separator .. "]+)") do
        table.insert(t, str)
    end

    return t
end
-- ###########################################################
-- Checks if a string starts with a another string
local function starts_with(str, start)
    return str:sub(1, #start) == start
end

local function create_textbox(args)
    return wibox.widget {
        text = args.text,
        align = args.align or "left",
        markup = args.markup,
        forced_width = args.forced_width or 60,
        widget = wibox.widget.textbox
    }
end
-- ###########################################################

-- ###########################################################

local function create_process_header()
    local res =
        wibox.widget {
        create_textbox {markup = "<b>   PID</b>"},
        create_textbox {markup = "<b>         Name</b>"},
        {
            create_textbox {markup = "<b> CPU</b>"},
            create_textbox {markup = "<b> MEM</b>"},
            layout = wibox.layout.align.horizontal
        },
        layout = wibox.layout.ratio.horizontal
    }
    res:adjust_ratio(2, 0.2, 0.47, 0.33)

    return res
end
-- ###########################################################

local function worker(user_args)
    local args = user_args or {}

    local width = args.width or 50
    local step_width = args.step_width or 2
    local step_spacing = args.step_spacing or 1
    local color = args.color or beautiful.fg_normal
    local process_info_max_length = args.process_info_max_length or -1
    local timeout = args.timeout or 1
    -- ###########################################################

    local cpugraph_widget =
        wibox.widget {
        max_value = 100,
        background_color = "#00000000",
        forced_width = width,
        step_width = step_width,
        step_spacing = step_spacing,
        widget = wibox.widget.graph,
        color = "linear:0,0:0,20:0,beautiful.xcolor1:0.3,beautiful.xcolor4:0.6," .. color
    }
    -- ###########################################################

    local popup =
        awful.popup {
        ontop = true,
        visible = false,
        shape = gears.shape.rounded_rect,
        border_width = 1,
        border_color = beautiful.xcolor8,
        bg = beautiful.xbackground .. "ee",
        maximum_width = 700,
        offset = {y = 5},
        widget = {}
    }
    -- ###########################################################

    -- Do not update process rows when mouse cursor is over the widget

    cpu:buttons(
        awful.util.table.join(
            awful.button(
                {},
                1,
                function()
                    if popup.visible then
                        popup.visible = not popup.visible
                    else
                        popup:move_next_to(mouse.current_widget_geometry)
                    end
                end
            )
        )
    )
    -- ###########################################################
    --- By default graph widget goes from left to right, so we mirror it and push up a bit
    local widget_icon =
        wibox.widget {
        id = "icon",
        image = beautiful.icon_cpu,
        forced_width = 48,
        forced_height = 48,
        widget = wibox.widget.imagebox
    }
    local cpu_button =
        wibox.widget {
        {
            {
                widget_icon,
                cpu,
                spacing = dpi(1),
                layout = wibox.layout.flex.horizontal
            },
            top = dpi(12),
            bottom = dpi(12),
            left = dpi(10),
            right = dpi(10),
            widget = wibox.container.margin
        },
        forced_width = dpi(115),
        shape = gears.shape.rounded_rect,
        bg = beautiful.bg_button,
        shape_border_color = beautiful.border_button,
        shape_border_width = dpi(1),
        widget = wibox.container.background
    }
    cpu_widget = cpu_button

    local cpus = {}
    watch(
        CMD,
        timeout,
        function(widget, stdout)
            local i = 1
            local j = 1
            for line in stdout:gmatch("[^\r\n]+") do
                if starts_with(line, "cpu") then
                    -- ###########################################################
                    -- ###########################################################

                    cpus[i] = {}

                    local name, user, nice, system, idle, iowait, irq, softirq, steal, _, _ =
                        line:match("(%w+)%s+(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)")

                    local total = user + nice + system + idle + iowait + irq + softirq + steal

                    local diff_idle = idle - tonumber(cpus[i]["idle_prev"] == nil and 0 or cpus[i]["idle_prev"])

                    local diff_total = total - tonumber(cpus[i]["total_prev"] == nil and 0 or cpus[i]["total_prev"])

                    local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

                    cpus[i]["total_prev"] = total
                    cpus[i]["idle_prev"] = idle

                    widget:add_value(diff_usage)
                    -- ###########################################################
                    -- usage bar configuration
                    local row =
                        wibox.widget {
                        create_textbox {text = name, align = "center"},
                        create_textbox {text = math.floor(diff_usage), align = "center"},
                        {
                            max_value = 100,
                            value = diff_usage,
                            forced_height = 30,
                            forced_width = 150,
                            paddings = 1,
                            margins = 4,
                            border_width = 1,
                            border_color = beautiful.bg_focus,
                            background_color = beautiful.xbackground .. "cc",
                            bar_border_width = 1,
                            bar_border_color = beautiful.xcolor0,
                            color = "linear:150,0:0,0:0,#ff29a8:0.3,#0badff:0.9," .. beautiful.xcolor6,
                            widget = wibox.widget.progressbar
                        },
                        layout = wibox.layout.ratio.horizontal
                    }
                    row:adjust_ratio(2, 0.15, 0.15, 0.7)
                    cpu_rows[i] = row
                    i = i + 1
                else
                    local columns = split(line, "|")

                    local pid = columns[1]
                    local comm = columns[2]
                    local cpu = columns[3]
                    local mem = columns[4]
                    local cmd = columns[5]

                    local pid_name_rest =
                        wibox.widget {
                        create_textbox {text = pid},
                        create_textbox {text = comm},
                        {
                            create_textbox {text = cpu, align = "center"},
                            create_textbox {text = mem, align = "center"},
                            layout = wibox.layout.fixed.horizontal
                        },
                        layout = wibox.layout.ratio.horizontal
                    }
                    pid_name_rest:adjust_ratio(2, 0.2, 0.47, 0.33)

                    -- ###########################################################
                    -- row spacing within the widget
                    local row =
                        wibox.widget {
                        {
                            pid_name_rest,
                            top = 4,
                            bottom = 4,
                            widget = wibox.container.margin
                        },
                        widget = wibox.container.background
                    }

                    row:connect_signal(
                        "mouse::enter",
                        function(c)
                            c:set_bg(beautiful.xbackground .. "dd")
                        end
                    )
                    row:connect_signal(
                        "mouse::leave",
                        function(c)
                            c:set_bg(beautiful.xbackground .. "bb")
                        end
                    )

                    -- ###########################################################
                    --position popup window on screen
                    awful.tooltip {
                        objects = {row},
                        mode = "outside",
                        preferred_positions = {"bottom"},
                        timer_function = function()
                            local text = cmd
                            if process_info_max_length > 0 and text:len() > process_info_max_length then
                                text = text:sub(0, process_info_max_length - 3) .. "..."
                            end

                            return text:gsub("%s%-", "\n\t-"):gsub(":/", "\n\t\t:/") -- put arguments on a new line -- java classpath uses : to separate jars
                        end
                    }

                    process_rows[j] = row

                    j = j + 1
                end
            end
            -- ###########################################################
            -- set up popup window
            popup:setup {
                {
                    cpu_rows,
                    {
                        orientation = "horizontal",
                        forced_height = 25,
                        color = beautiful.bg_focus,
                        widget = wibox.widget.separator
                    },
                    create_process_header(),
                    process_rows,
                    layout = wibox.layout.fixed.vertical
                },
                margins = 0,
                widget = wibox.container.margin
            }
        end,
        cpugraph_widget
    )

    return cpu_widget
end
-- ###########################################################

return setmetatable(
    cpu_widget,
    {
        __call = function(_, ...)
            return worker(...)
        end
    }
)
