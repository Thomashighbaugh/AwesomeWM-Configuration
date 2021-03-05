--[[ 
	 _______ ______ ______ _______    __              
|   _   |   __ \   __ \     __|  |  |.--.--.---.-.
|       |    __/    __/__     |__|  ||  |  |  _  |
|___|___|___|  |___|  |_______|__|__||_____|___._|
                                                  
       by Thomas Leon Highbaugh
    
     Created:
       3/4/2021, 3:26:49 PM
     Last edited:
       3/4/2021, 3:27:01 PM
     Auto updated?
       Yes
    
     Description:
       variable definitions that will be used across the configuration
--]]



local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()
local bin_dir = config_dir .. 'binaries/'
local screen = _G.screen
local awful = require('awful')

return {
	-- The default applications in keybindings and widgets
	default = {
		terminal = 'kitty', -- Terminal Emulator
		text_editor = 'vim', -- GUI Text Editor
		web_browser = 'firefox-nightly', -- Web browser
		alt_web_browser = 'chromium', -- Web browser
		mail_client = 'thunderbird', -- Mail client
		gui_file_manager = 'caja', -- GUI File manager
		file_manager = 'ranger', -- File manager
		password_manager = 'keepassxc', -- Password manager
		gui_ide = 'code',
		default_player = 'spotify',
		network_manager = 'nm-connection-editor', -- Network manager
		bluetooth_manager = 'blueman-manager', -- Bluetooth manager
		power_manager = 'xfce4-power-manager-settings', -- Power manager
		package_manager = 'yay', -- Package manager
		lock = 'screenlock', --'awesome-client "_G.show_lockscreen()"',  -- Lockscreen
		rofiglobal = 'rofi -dpi ' ..
			screen.primary.dpi ..
				' -show "Global Search" -modi "Global Search":' ..
					config_dir ..
						'/configuration/rofi/sidebar/rofi-spotlight.sh' .. ' -theme ' .. config_dir .. '/external/appmenu.rasi', -- Rofi Global Search
		rofiappmenu = 'rofi -show drun -theme ~/.config/awesome/external/rofi/appmenu/rofi.rasi',
		-- for network applety thing
		wifi_interface = 'wlan0',
		eth_interface = 'enp0s31f6',
		vpn = 'LRZ-VPN'
		-- You can add more default applications here
	},
	-- List of apps to start once on start-up
	run_on_start_up = {os.getenv('HOME') .. '/.config/awesome/autostart.sh'}
}
