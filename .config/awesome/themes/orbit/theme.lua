-- dunzor2, awesome3 theme, by dunz0r
-- modified by bakoenig
-- now called "orbit"

local awful = require("awful")
awful.util = require("awful.util")

theme = {}
config = awful.util.getdir("config")
themedir = config .. "/themes/orbit"
theme.wallpaper = themedir .. "/background.jpg"


theme.font          = "Clean 9"

theme.bg_normal     = "#1a1a1a"
theme.bg_focus      = "#3e3e3e"
theme.bg_urgent     = "#303030"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#898989"
theme.fg_focus      = "#929200"
theme.fg_unfocus    = "#606060"
theme.fg_urgent     = "#98565e"
theme.fg_highlight  = "#98565e"
theme.fg_minimize   = "#98565e"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#a6a600"
theme.border_marked = "#91231c"

-- widget colours
theme.wid_rl = "#98565e"
theme.wid_rh = "#cfa3a9"
theme.wid_gl = "#66825d"
theme.wid_gh = "#caf7bb"
theme.wid_yl = "#969176"
theme.wid_yh = "#fff8bc"
theme.wid_bl = "#4d6585"
theme.wid_bh = "#83aebe"
theme.wid_ml = "#967395"
theme.wid_mh = "#bba9cf"
theme.wid_cl = "#5f7f7b"
theme.wid_ch = "#96cccc"

-- {{{ Widgets
theme.fg_widget        = "#aecf96"
theme.fg_center_widget = "#88a175"
theme.fg_end_widget    = "#ff5656"
theme.bg_widget        = "#494b4f"

-- {{{ Mouse finder
theme.mouse_finder_color = "#cc9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themedir .. "/taglist/square_a.png"
theme.taglist_squares_unsel = themedir .. "/taglist/square_b.png"
--theme.taglist_squares_resize = "false"

-- {{{ Misc
theme.awesome_icon           	= "/usr/share/awesome/themes/zenburn/awesome-icon.png"
theme.menu_submenu_icon      	= "~/.config/awesome/icons/submenu.png"
theme.tasklist_floating_icon 	= "/usr/share/awesome/themes/default/tasklist/floatingw.png"

-- {{{ Layout
theme.layout_tile       = themedir .. "/layouts/tile.png"
theme.layout_tileleft   = themedir .. "/layouts/tileleftw.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottomw.png"
theme.layout_tiletop    = themedir .. "/layouts/tiletopw.png"
theme.layout_fairv      = themedir .. "/layouts/fairv.png"
theme.layout_fairh      = themedir .. "/layouts/fairh.png"
theme.layout_spiral     = themedir .. "/layouts/spiralw.png"
theme.layout_dwindle    = themedir .. "/layouts/dwindlew.png"
theme.layout_max        = themedir .. "/layouts/max.png"
theme.layout_fullscreen = themedir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themedir .. "/layouts/magnifier.png"
theme.layout_floating   = themedir .. "/layouts/floatingw.png"

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

-- Titlebar
-- this theme has no titlebar icons specified

orange 	= "#f1af5f"
red 	= "#de5e1e"
blue 	= "#7788af"

return theme

