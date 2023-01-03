local programs = { }

local browswer = os.getenv('BROWSER')  or 'librewolf'
local editor   = os.getenv('EDITOR')   or 'nvim'
local terminal = os.getenv('TERMINAL') or 'alacritty'

return programs
