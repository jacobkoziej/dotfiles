local programs = { }

-- generic
programs.browswer = os.getenv('BROWSER')  or 'librewolf'
programs.editor   = os.getenv('EDITOR')   or 'nvim'
programs.terminal = os.getenv('TERMINAL') or 'alacritty'

return programs
