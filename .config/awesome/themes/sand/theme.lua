-------------------------------
--  "Desert" awesome theme  --
--    By Daes DP. (2011)   --
-------------------------------
-- modified by bakoenig
-- Sep 2013
-- now called "Sand"
-------------------------------

local awful = require("awful")
awful.util = require("awful.util")

theme = {}
config = awful.util.getdir("config")
themedir = config .. "/themes/sand"
theme.wallpaper = themedir .. "/background.jpg"

theme.font      = "Tamsyn Mono 10.5"

-- sand panel
theme.fg_normal = "#222222"
theme.fg_focus  = "#800032"
theme.fg_urgent = "#629632"
theme.bg_normal = "#aea79f"
theme.bg_focus  = "#aea79f"
theme.bg_urgent = "#aea79f"
theme.bg_wibox  = "#aea79f"
theme.taglist_bg_focus   	= "#938a7f"
theme.tasklist_bg_focus     = "#938a7f"

-- dark panel
--theme.fg_normal = "#D5D5D5"
--theme.fg_focus  = "#a86500"
--theme.fg_urgent = "#990000"
--theme.bg_normal = "#151515f0"
--theme.bg_focus  = "#151515f0"
--theme.bg_urgent = "#151515aa"
--theme.bg_wibox  = "#323232"

theme.border_width  = "1"
theme.border_width_panel  = "1"
theme.border_panel = "#050505"
theme.border_normal = "#151515"
theme.border_wnormal = "#303030"
theme.border_focus  = "#303030"
theme.border_marked = "#CC9393"

theme.menu_height = "15"
theme.menu_width  = "150"

theme.taglist_squares_sel   = themedir .. "/taglist/squaref.png"
theme.taglist_squares_unsel = themedir .. "/taglist/squareb.png"
theme.taglist_squares_resize = "false"

theme.awesome_icon           	= "~/.config/awesome/icons/awesome16.png"
theme.menu_submenu_icon      	= "~/.config/awesome/icons/submenu.png"
--theme.tasklist_floating_icon 	= "/usr/share/awesome/themes/default/tasklist/floatingw.png"

theme.layout_tile       = themedir .. "/layouts/tile.png"
theme.layout_tileleft   = themedir .. "/layouts/tileleft.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottom.png"
theme.layout_tiletop    = themedir .. "/layouts/tiletop.png"
theme.layout_fairv      = themedir .. "/layouts/fairv.png"
theme.layout_fairh      = themedir .. "/layouts/fairh.png"
theme.layout_spiral     = themedir .. "/layouts/spiral.png"
theme.layout_dwindle    = themedir .. "/layouts/dwindle.png"
theme.layout_max        = themedir .. "/layouts/max.png"
theme.layout_fullscreen = themedir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themedir .. "/layouts/magnifier.png"
theme.layout_floating   = themedir .. "/layouts/floating.png"

theme.layout_txt_tile               = "[t]"
theme.layout_txt_tileleft           = "[l]"
theme.layout_txt_tilebottom         = "[b]"
theme.layout_txt_tiletop            = "[tt]"
theme.layout_txt_fairv              = "[fv]"
theme.layout_txt_fairh              = "[fh]"
theme.layout_txt_spiral             = "[s]"
theme.layout_txt_dwindle            = "[d]"
theme.layout_txt_max                = "[m]"
theme.layout_txt_fullscreen         = "[F]"
theme.layout_txt_magnifier          = "[M]"
theme.layout_txt_floating           = "[|]"

orange 	= "#cc2a00"
red 	= "#aa3e48"
blue 	= "#003366"

return theme
