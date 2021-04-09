--  _______                                             ________ _______
-- |   _   |.--.--.--.-----.-----.-----.--------.-----.|  |  |  |   |   |
-- |       ||  |  |  |  -__|__ --|  _  |        |  -__||  |  |  |       |
-- |___|___||________|_____|_____|_____|__|__|__|_____||________|__|_|__|
--
--                                                  Thomas Leon Highbaugh
-- ========================================================================
-- Warning the following configuration contains so much spaghetti code, it
-- may soon transcend into the Flying Spaghetti Monster.
-- ========================================================================
-- ===================================================================
--  External Libraries
-- ===================================================================
-- External Package Manager Call
pcall(require, "luarocks.loader")

-- Standard AwesomeWM Libraries
local gears = require("gears")
local awful = require("awful")
local freedesktop = require("external.lib.freedesktop")

-- ===================================================================
-- Theme Handling Library

local beautiful = require("beautiful")

-- ===================================================================
-- Miscellanous AwesomeWM Libraries

local menubar = require("menubar")
local lain = require("lain")
local vicious = require("vicious")
-- ===================================================================
-- My Configuration
-- ===================================================================
beautiful.init(require("themes"))
-- ===================================================================
-- Global Namespace,

RC = {}
wallpaper = require("main.wallpaper")

-- ===================================================================
-- User Variables

RC.vars = require("main.user-variables")
RC.autostart()

-- ===================================================================
-- Variables declared Globally

-- Meaning I do not have to worry about the import process later (but
-- still do it anyway most of the time ;])

modkey = RC.vars.modkey
terminal = RC.vars.terminal
browser = RC.vars.browser
screenshot = RC.vars.screenshot

-- ===================================================================
-- Error handling
require("main.error-handling")
-- window flash with focus change
local bling = require("external.lib.bling")
bling.module.flash_focus.enable()

-- ===================================================================
-- Load the user themes

-- ===================================================================
-- Custom Local Libraries
local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    menu = require("main.menu"),
    rules = require("main.rules"),
    helpers = require("main.helpers"),
    wallpaper = require("main.wallpaper")
}

-- ===================================================================
-- Layouts

RC.layouts = main.layouts()

-- ===================================================================
-- Tags
RC.tags = main.tags()
require("layout.exit-screen")

-- ===================================================================
-- Custom Local Library: Keys and Mouse Binding
local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys = require("binding.globalkeys"),
    clientkeys = require("binding.clientkeys"),
    bindtotags = require("binding.bindtotags")
}

-- ===================================================================
-- Menu

RC.mainmenu = awful.menu({items = main.menu()}) -- in globalkeys
RC.launcher =
    awful.widget.launcher(
    {
        image = beautiful.awesome_icon,
        menu = RC.mainmenu
    }
)
menubar.utils.terminal = RC.vars.terminal

-- ===================================================================
-- Mouse and Key bindings

RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- ===================================================================
-- Set root

root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- ===================================================================
-- Statusbar: Wibar

require("layout.topbar")
require("layout.bottombar")
-- ===================================================================
-- Rules

awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

-- ===================================================================
-- Signals

RC.signals = require("main.signals")
RC.notifications = require("notifications")

awful.spawn.with_shell("$HOME/.config/awesome/autostart.sh")

-- ===================================================================
-- Uncomment the below if you like the lib nice window icons better,
-- otherwise the present default will provide you with my modified
-- elenapan icons.
-- local nice = require( "external.lib.nice.local" )

-- ===================================================================
-- Garbage Collection
-- ===================================================================
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 100)
