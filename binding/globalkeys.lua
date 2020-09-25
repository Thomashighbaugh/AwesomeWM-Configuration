--  _______ __         __           __   __  __
-- |     __|  |.-----.|  |--.---.-.|  | |  |/  |.-----.--.--.-----.
-- |    |  |  ||  _  ||  _  |  _  ||  | |     < |  -__|  |  |__ --|
-- |_______|__||_____||_____|___._||__| |__|\__||_____|___  |_____|
--                                                    |_____|
-- ===================================================================
--  Import Libraries and Utilities
-- ===================================================================
-- Standard awesome library
local gears = require( "gears" )
local awful = require( "awful" )
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require( "awful.hotkeys_popup" )
-- Menubar library
local menubar = require( "menubar" )

local beautiful = require( "beautiful" )

-- libs for window management
local revelation = require( "lib.revelation" )
local poppin = require( 'lib.poppin' )
local switcher = require( "lib.awesome-switcher" )
local quake = require( "layout.quake" )
require ( "layout.exit-screen" )
-- lib variables  and init
revelation.init( )

local _M = { }

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- ===================================================================
--  Bind functions to Keys
-- ===================================================================

function _M.get( )
    local globalkeys = gears.table.join(
        -- ===================================================================
        -- Show Keybindings Help
        awful.key({ modkey, }, "Insert",
            hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),
        
        -- ===================================================================
        
        awful.key({ "Mod1", }, "Tab",
            function ( )
                switcher.switch( 1, "Mod1", "Alt_L", "Shift", "Tab" )
            end ),
            
            -- ===================================================================
            
            awful.key({ "Mod1", "Shift" }, "Tab",
                function ( )
                    switcher.switch( -1, "Mod1", "Alt_L", "Shift", "Tab" )
                end ),
                
                -- ===================================================================
                -- exit screen
                awful.key({ modkey, "Control" }, "x",
                    function ( )
                        exit_screen_show( )
                    end,
                { description = "quit awesome", group = "awesome" }),
                -- ===================================================================
                -- local quake = require("quake")
                
                awful.key({ modkey }, "`",
                    function ( )
                    quakeconsole[ s ]:toggle( ) end,
                { description = "Quake Terminal Hopefully" }),
                -- ===================================================================
                -- Revelation
                awful.key({ modkey, }, "e", revelation,
                { description = "show all windows", group = "awesome" }),
                
                -- Screenshot on prtscn using configuration/screenshots program
                awful.key({ modkey, }, "Print",
                    function ( )
                        awful.spawn( "/home/tlh/.config/awesome/external/screenshots area" )
                    end,
                { description = "Take a Selection Screenshot", group = "Launcher" }),
                
                -- ===================================================================
                -- launch rofi app menu *Note this is bound to just mod4 thanks to xcape see main/apps.lua
                awful.key({ modkey, "Control" }, "Escape",
                    function( )
                        awful.spawn( "rofi  -show drun -theme ~/.config/awesome/external/rofi/appmenu/rofi.rasi" )
                    end,
                { description = "Application Launcher", group = "Launcher" }),
                
                -- ===================================================================
                --Browser Launch
                awful.key(
                    { modkey, },
                    "F2",
                    function ( )
                        awful.spawn( browser )
                    end,
                { description = "Launch Firefox", group = 'Launcher' }),
                -- ===================================================================
                --Alternative Browser Launch
                awful.key(
                    { modkey, "Shift" },
                    "F2",
                    function ( ) awful.spawn( "chromium" )
                    end,
                { description = "Launch Chromium", group = 'Launcher' }),
                
                -- ===================================================================
                --File Manager
                awful.key(
                    { modkey, },
                    "F3",
                    function ( )
                        awful.spawn( 'thunar' )
                    end,
                { description = "Launch File Manager", group = 'Launcher' }),
                
                -- ===================================================================
                -- Terminal File Manager
                awful.key(
                    { modkey, "Shift" },
                    "F3",
                    function ( )
                        awful.spawn( "gksu ranger" )
                    end,
                { description = "Launch Terminal File Manager", group = 'Launcher' }),
                
                -- ===================================================================
                -- Font Awesome Clipboard
                awful.key(
                    { modkey, },
                    "F4",
                    function( )
                        awful.spawn.easy_async_with_shell( "~/.config/awesome/external/rofi/icon-browser/fa-rofi.sh" )
                    end,
                { description = "Copy Font - Awesome Icons to Clipboard", group = 'Launcher' }),
                
                -- ===================================================================
                awful.key(
                    { modkey, "Shift" },
                    "F4",
                    function( )
                        awful.spawn.easy_async_with_shell( "emojipick" )
                    end,
                { description = "Copy Emojis to Clipboard", group = 'Launcher' }),
                
                -- ===================================================================
                -- Picom
                awful.key(
                    { modkey, },
                    "F5",
                    function( )
                        awful.spawn.with_shell( "sudo picom - b && notify -send 'Compton Activated'" )
                    end,
                { description = "Turn on Picom", group = 'Launcher' }),
                
                -- ===================================================================
                -- Picom OFF
                awful.key(
                    { modkey, "Shift" },
                    "F5",
                    function( )
                        awful.spawn.with_shell( "sudo pkill picom && notify -send 'Compton Deactivated'" )
                    end,
                { description = "Turn off Picom", group = 'Launcher' }),
                
                -- ===================================================================
                awful.key(
                    { modkey, },
                    "F6",
                    function ( )
                        awful.spawn.with_shell( "menu_network" )
                    end,
                { description = "Launch Network Manager Menu", group = 'Launcher' }),
                
                -- ===================================================================
                awful.key(
                    { modkey, "Control" },
                    'Delete',
                    function( )
                        awful.spawn( 'kitty -e htop' )
                    end,
                { description = "open system monitor", group = 'Launcher' }),
                
                -- ===================================================================
                --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
                
                awful.key({ modkey, }, "j",
                    function ( )
                        awful.client.focus.byidx( 1 )
                    end,
                { description = "focus next by index", group = "client" }),
                awful.key({ modkey, }, "k",
                    function ( )
                        awful.client.focus.byidx( -1 )
                    end,
                { description = "focus previous by index", group = "client" }),
                awful.key({ modkey, }, "w", function ( ) RC.mainmenu:show( ) end,
                { description = "show main menu", group = "awesome" }),
                
                --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
                -- Layout manipulation
                awful.key({ modkey, "Shift" }, "j", function ( ) awful.client.swap.byidx( 1 ) end,
                { description = "swap with next client by index", group = "client" }),
                
                awful.key({ modkey, "Shift" }, "k", function ( ) awful.client.swap.byidx( -1 ) end,
                { description = "swap with previous client by index", group = "client" }),
                
                awful.key({ modkey, "Control" }, "j", function ( ) awful.screen.focus_relative( 1 ) end,
                { description = "focus the next screen", group = "screen" }),
                
                awful.key({ modkey, "Control" }, "k", function ( ) awful.screen.focus_relative( -1 ) end,
                { description = "focus the previous screen", group = "screen" }),
                
                awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
                { description = "jump to urgent client", group = "client" }),
                
                awful.key({ modkey, }, "Tab",
                    function ( )
                        awful.client.focus.history.previous( )
                        if client.focus then
                            client.focus:raise( )
                        end
                    end,
                { description = "go back", group = "client" }),
                
                --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
                -- Standard program
                awful.key({ modkey, }, "Return", function ( ) awful.spawn( terminal ) end,
                { description = "open a terminal", group = "Launcher" }),
                awful.key({ modkey, }, "r", awesome.restart,
                { description = "reload awesome", group = "awesome" }),
                awful.key({ modkey, "Shift" }, "q", awesome.quit,
                { description = "quit awesome", group = "awesome" }),
                
                --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
                -- Layout manipulation
                awful.key({ modkey, }, "l", function ( ) awful.tag.incmwfact( 0.05 ) end,
                { description = "increase master width factor", group = "layout" }),
                
                awful.key({ modkey, }, "h", function ( ) awful.tag.incmwfact( -0.05 ) end,
                { description = "decrease master width factor", group = "layout" }),
                
                awful.key({ modkey, "Shift" }, "h", function ( ) awful.tag.incnmaster( 1, nil, true ) end,
                { description = "increase the number of master clients", group = "layout" }),
                
                awful.key({ modkey, "Shift" }, "l", function ( ) awful.tag.incnmaster( -1, nil, true ) end,
                { description = "decrease the number of master clients", group = "layout" }),
                
                awful.key({ modkey, "Control" }, "h", function ( ) awful.tag.incncol( 1, nil, true ) end,
                { description = "increase the number of columns", group = "layout" }),
                
                awful.key({ modkey, "Control" }, "l", function ( ) awful.tag.incncol( -1, nil, true ) end,
                { description = "decrease the number of columns", group = "layout" }),
                
                awful.key({ modkey, }, "space", function ( ) awful.layout.inc( 1 ) end,
                { description = "select next", group = "layout" }),
                
                awful.key({ modkey, "Shift" }, "space", function ( ) awful.layout.inc( -1 ) end,
                { description = "select previous", group = "layout" }),
                
                awful.key({ modkey, "Control" }, "n",
                    function ( )
                        local c = awful.client.restore( )
                        -- Focus restored client
                        if c then
                            c:emit_signal(
                            "request::activate", "key.unminimize", { raise = true })
                        end
                    end,
                { description = "restore minimized", group = "client" }),
                
                --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
                -- Prompt
                awful.key({ modkey, "Shift" }, "r", function ( ) awful.screen.focused( ).mypromptbox:run( ) end,
                { description = "run prompt", group = "Launcher" }),
                
                --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
                -- Menubar
                awful.key({ modkey, "Shift" }, "p", function( ) menubar.show( ) end,
                { description = "show the menubar", group = "Launcher" })
                
            )
            
            return globalkeys
        end
        
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        
        return setmetatable({ }, {
            __call = function( _, ... ) return _M.get( ... ) end
        })
        
