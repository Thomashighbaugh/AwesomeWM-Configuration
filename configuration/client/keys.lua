local awful = require('awful')
local gears = require('gears')

require('awful.autofocus')

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local dpi = require('beautiful').xresources.apply_dpi
local beautiful = require('beautiful')

local clientKeys =
	awful.util.table.join(
	awful.key(
		{modkey},
		'm',
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = 'toggle fullscreen', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey},
		'x',
		function(c)
			c:kill()
		end,
		{description = 'close', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Control'},
		'space',
		awful.client.floating.toggle,
		{description = 'toggle floating', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Control'},
		'Return',
		function(c)
			c:swap(awful.client.getmaster())
		end,
		{description = 'move to master', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Shift'},
		'p',
		function(c)
			c:move_to_screen(-1)
		end,
		{description = 'move to screen', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey, 'Shift'},
		'o',
		function(c)
			c:move_to_screen(1)
		end,
		{description = 'move to screen', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey},
		't',
		function(c)
			c.ontop = not c.ontop
		end,
		{description = 'toggle keep on top', group = 'client'}
	),
	--#################################################
	awful.key(
		{modkey},
		'n',
		function(c)
			c.minimized = not c.minimized
		end,
		{description = 'Minimize focused client', group = 'client'}
	)

	-- awful.key({ modkey,           }, "m",

	--     function (c)
	--         c.maximized = not c.maximized
	--         c:raise()
	--     end ,
	--     {description = "(un)maximize", group = "client"}),
	--#################################################
	-- awful.key({ modkey, "Shift" }, "m",
	--     function (c)
	--         c.maximized_vertical = not c.maximized
	--         c:raise()
	--     end ,
	--     {description = "(un)maximize vertically", group = "client"}),
	--#################################################
	-- -- toggle fullscreen
	-- awful.key(
	-- 	{modkey},
	-- 	'f',
	-- 	function(c)
	-- 		-- Toggle fullscreen
	-- 		c.fullscreen = not c.fullscreen
	-- 		c:raise()
	-- 	end,
	-- 	{description = 'toggle fullscreen', group = 'client'}
	-- ),

	-- -- close client
	-- awful.key(
	-- 	{modkey},
	-- 	'q',
	-- 	function(c)
	-- 		c:kill()
	-- 	end,
	-- 	{description = 'close', group = 'client'}
	-- ),
	-- -- Default client focus
	-- awful.key(
	-- 	{modkey},
	-- 	'd',
	-- 	function()
	-- 		awful.client.focus.byidx(1)
	-- 	end,
	-- 	{description = 'focus next by index', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey},
	-- 	'a',
	-- 	function()
	-- 		awful.client.focus.byidx(-1)
	-- 	end,
	-- 	{description = 'focus previous by index', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{ modkey, "Shift"  },
	-- 	"d",
	-- 	function ()
	-- 		awful.client.swap.byidx(1)
	-- 	end,
	-- 	{description = "swap with next client by index", group = "client"}
	-- ),
	-- awful.key(
	-- 	{ modkey, "Shift" },
	-- 	"a",
	-- 	function ()
	-- 		awful.client.swap.byidx(-1)
	-- 	end,
	-- 	{description = "swap with next client by index", group = "client"}
	-- ),

	-- awful.key(
	-- 	{modkey},
	-- 	'u',
	-- 	awful.client.urgent.jumpto,
	-- 	{description = 'jump to urgent client', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey},
	-- 	'Tab',
	-- 	function()
	-- 		awful.client.focus.history.previous()
	-- 		if client.focus then
	-- 			client.focus:raise()
	-- 		end
	-- 	end,
	-- 	{description = 'go back', group = 'client'}
	-- ),
	-- awful.key(
	-- {modkey},
	-- 'n',
	-- function(c)
	-- c.minimized = true
	-- end,
	-- {description = "minimize client", group = 'client'}
	-- ),
	-- -- move floating client to center
	-- awful.key(
	-- 	{ modkey, "Shift" },
	-- 	"c",
	-- 	function(c)
	-- 		local focused = awful.screen.focused()

	-- 		awful.placement.centered(c, {
	-- 			honor_workarea = true
	-- 		})
	-- 	end,
	-- 	{description = 'align a client to the center of the focused screen.', group = "client"}
	-- ),

	-- -- toggle client floating mode
	-- awful.key(
	-- 	{modkey},
	-- 	'c',
	-- 	function(c)
	-- 		c.fullscreen = false
	-- 		c.maximized = false
	-- 		c.floating = not c.floating
	-- 		c:raise()
	-- 	end,
	-- 	{description = 'toggle floating', group = 'client'}
	-- ),

	-- move client position
	-- awful.key(
	-- 	{modkey},
	-- 	'-',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(0, dpi(-10), 0, 0)
	-- 		end
	-- 	end,
	-- 	{description = 'move floating client up by 10 px', group = 'client'}
	-- )--,
	-- awful.key(
	-- 	{modkey},
	-- 	'Down',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(0, dpi(10), 0, 0)
	-- 		end
	-- 	end,
	-- 	{description = 'move floating client down by 10 px', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey},
	-- 	'Left',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(dpi(-10), 0, 0, 0)
	-- 		end
	-- 	end,
	-- 	{description = 'move floating client to the left by 10 px', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey},
	-- 	'Right',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(dpi(10), 0, 0, 0)
	-- 		end
	-- 	end,
	-- 	{description = 'move floating client to the right by 10 px', group = 'client'}
	-- ),

	-- -- Increasing floating client size
	-- awful.key(
	-- 	{modkey, 'Shift'},
	-- 	'Up',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(0, dpi(-10), 0, dpi(10))
	-- 		end
	-- 	end,
	-- 	{description = 'increase floating client size vertically by 10 px up', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey, 'Shift'},
	-- 	'Down',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(0, 0, 0, dpi(10))
	-- 		end
	-- 	end,
	-- 	{description = 'increase floating client size vertically by 10 px down', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey, 'Shift'},
	-- 	'Left',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(dpi(-10), 0, dpi(10), 0)
	-- 		end
	-- 	end,
	-- 	{description = 'increase floating client size horizontally by 10 px left', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey, 'Shift'},
	-- 	'Right',
	-- 	function(c)
	-- 		if c.floating then
	-- 			c:relative_move(0, 0, dpi(10), 0)
	-- 		end
	-- 	end,
	-- 	{description = 'increase floating client size horizontally by 10 px right', group = 'client'}
	-- ),

	-- -- Decreasing floating client size
	-- awful.key(
	-- 	{modkey, 'Control'},
	-- 	'Up',
	-- 	function(c)
	-- 		if c.floating and c.height > 10 then
	-- 			c:relative_move(0, 0, 0, dpi(-10))
	-- 		end
	-- 	end,
	-- 	{description = 'decrease floating client size vertically by 10 px up', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey, 'Control'},
	-- 	'Down',
	-- 	function(c)
	-- 		if c.floating then
	-- 			local c_height = c.height
	-- 			c:relative_move(0, 0, 0, dpi(-10))
	-- 			if c.height ~= c_height and c.height > 10 then
	-- 				c:relative_move(0, dpi(10), 0, 0)
	-- 			end
	-- 		end
	-- 	end,
	-- 	{description = 'decrease floating client size vertically by 10 px down', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey, 'Control'},
	-- 	'Left',
	-- 	function(c)
	-- 		if c.floating and c.width > 10 then
	-- 			c:relative_move(0, 0, dpi(-10), 0)
	-- 		end
	-- 	end,
	-- 	{description = 'decrease floating client size horizontally by 10 px left', group = 'client'}
	-- ),
	-- awful.key(
	-- 	{modkey, 'Control'},
	-- 	'Right',
	-- 	function(c)
	-- 		if c.floating then
	-- 			local c_width = c.width
	-- 			c:relative_move(0, 0, dpi(-10), 0)
	-- 			if c.width ~= c_width and c.width > 10 then
	-- 				c:relative_move(dpi(10), 0 , 0, 0)
	-- 			end
	-- 		end
	-- 	end,
	-- 	{description = 'decrease floating client size horizontally by 10 px right', group = 'client'}
	-- )
)

return clientKeys
