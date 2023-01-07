local programs = { }

-- generic
programs.browswer = os.getenv('BROWSER')  or 'librewolf'
programs.editor   = os.getenv('EDITOR')   or 'nvim'
programs.terminal = os.getenv('TERMINAL') or 'alacritty'

-- specific
programs.arandr     = 'arandr'
programs.discord    = 'discord'
programs.dmenu      = 'dmenu_run'
programs.lockscreen = 'slock'
programs.pactl      = 'pactl'
programs.pass       = 'passmenu'
programs.playerctl  = 'playerctl'
programs.screenkey  = 'screenkey'
programs.signal     = 'signal'
programs.xbacklight = 'xbacklight'

return programs
