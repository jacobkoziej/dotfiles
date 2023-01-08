local awful    = require 'awful'
local gears    = require 'gears'
local programs = require 'jacobkoziej.programs'

globalkeys = gears.table.join(globalkeys,
	-- XF86Audio
	awful.key(nil, 'XF86AudioPlay',
		function()
			awful.spawn(programs.playerctl..' play-pause')
		end
	),
	awful.key(nil, 'XF86AudioStop',
		function()
			awful.spawn(programs.playerctl..' stop')
		end
	),
	awful.key(nil, 'XF86AudioNext',
		function()
			awful.spawn(programs.playerctl..' next')
		end
	),
	awful.key(nil, 'XF86AudioPrev',
		function()
			awful.spawn(programs.playerctl..' previous')
		end
	),
	awful.key(nil, 'XF86AudioMute',
		function()
			awful.spawn(programs.pactl..' set-sink-mute @DEFAULT_SINK@ toggle')
		end
	),
	awful.key(nil, 'XF86AudioLowerVolume',
		function()
			awful.spawn(programs.pactl..' set-sink-volume @DEFAULT_SINK@ -2%')
		end
	),
	awful.key(nil, 'XF86AudioRaiseVolume',
		function()
			awful.spawn(programs.pactl..' set-sink-volume @DEFAULT_SINK@ +2%')
		end
	),
	awful.key(nil, 'XF86AudioMicMute',
		function()
			awful.spawn(programs.pactl..' set-source-mute @DEFAULT_SOURCE@ toggle')
		end
	),

	-- XF86Display
	awful.key(nil, 'XF86Display',
		function()
			awful.spawn(programs.arandr)
		end
	),

	-- XF86Mon
	awful.key(nil, 'XF86MonBrightnessDown',
		function()
			awful.spawn(programs.xbacklight..' -10')
		end
	),
	awful.key(nil, 'XF86MonBrightnessUp',
		function()
			awful.spawn(programs.xbacklight..' +10')
		end
	)
)
