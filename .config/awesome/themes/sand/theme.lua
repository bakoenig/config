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

theme.font      = "Droid Sans 10"

-- sand panel
theme.fg_normal = "#000000"
theme.fg_focus  = "#a52a2a"
theme.fg_urgent = "#990000"
theme.bg_normal = "#aea79f"
theme.bg_focus  = "#aea79f"
theme.bg_urgent = "#151515"
theme.bg_wibox  = "#aea79f"

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
theme.taglist_squares_unsel = themedir .. "/taglist/square.png"
theme.taglist_squares_resize = "false"

theme.awesome_icon           	= "/usr/share/awesome/themes/zenburn/awesome-icon.png"
theme.menu_submenu_icon      	= "~/.config/awesome/icons/submenu.png"
theme.tasklist_floating_icon 	= "/usr/share/awesome/themes/default/tasklist/floatingw.png"
theme.neticon 			= themedir .. "icons/transfer.png"

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

theme.titlebar_close_button_focus  = themedir .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themedir .. "/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active  = themedir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themedir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themedir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themedir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active  = themedir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themedir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themedir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themedir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active  = themedir .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themedir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themedir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themedir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active  = themedir .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themedir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themedir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themedir .. "/titlebar/maximized_normal_inactive.png"

return theme
