--  ---.-.--.--.|  |_.-----.-----.|  |_.---.-.----.|  |_
-- |  _  |  |  ||   _|  _  |__ --||   _|  _  |   _||   _|
-- |___._|_____||____|_____|_____||____|___._|__|  |____|
-- ===================================================================
-- Libraries
-- ===================================================================
local awful = require('awful')
-- ===================================================================
-- Applications to Start with Awesome
-- Note: xprofile will also work for this (or startx depending on your
-- DM configuration) but that only runs truly at startup, this runs when
-- you refresh awesome as well.
-- ===================================================================
local run_on_start_up = {
	' picom -b --experimental-backends --dbus --config  ~/.config/awesome/external/picom.conf & ',
	-- I like when I press the Windows key, a menu to come up
	' xcape -e "Super_L=Super_L|Control_L|Escape" & ',
	-- because its annoying when trying to punch in a phone number and instead you send the cursor flying wildly around the page
	'numlockx on',
	'./.dropbox-dist/dropboxd &'
}

-- ===================================================================
-- Autostart Enumerated Applications
-- ===================================================================

local function autostart()
	for _, app in ipairs(run_on_start_up) do
		local findme = app
		local firstspace = app:find(' ')
		if firstspace then
			findme = app:sub(0, firstspace - 1)
		end
		awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, app), false)
	end
end

return autostart
-- EOF ------------------------------------------------------------------------
