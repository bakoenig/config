-- dunzor2, awesome3 theme, by dunz0r

--{{{ Main
local awful = require("awful")
awful.util = require("awful.util")

theme = {}

config        = awful.util.getdir("config")
shared        = "~/.config/awesome"
sharedicons   = shared .. "/icons"
themedir  = shared .. "/themes"
themes        = config .. "/themes"

config = awful.util.getdir("config")
themedir = config .. "/themes/orbit"
theme.wallpaper = themedir .. "/background2.jpg"


theme.font          = "Terminus 9"

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

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.fg_widget        = "#aecf96"
theme.fg_center_widget = "#88a175"
theme.fg_end_widget    = "#ff5656"
theme.bg_widget        = "#494b4f"
theme.border_widget    = "#3f3f3f"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#cc9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themedir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = themedir .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
--theme.awesome_icon           = themedir .. "/awesome-icon.png"
theme.menu_submenu_icon      = themedir .. "/default/submenu.png"
theme.tasklist_floating_icon = themedir .. "/default/tasklist/floatingw.png"
-- }}}

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
-- }}}

-- {{{ Titlebar
--theme.titlebar_close_button_focus  = themedir .. "/titlebar/close_focus.png"
--theme.titlebar_close_button_normal = themedir .. "/titlebar/close_normal.png"
--
--theme.titlebar_ontop_button_focus_active  = themedir .. "/titlebar/ontop_focus_active.png"
--theme.titlebar_ontop_button_normal_active = themedir .. "/titlebar/ontop_normal_active.png"
--theme.titlebar_ontop_button_focus_inactive  = themedir .. "/titlebar/ontop_focus_inactive.png"
--theme.titlebar_ontop_button_normal_inactive = themedir .. "/titlebar/ontop_normal_inactive.png"
--
--theme.titlebar_sticky_button_focus_active  = themedir .. "/titlebar/sticky_focus_active.png"
--theme.titlebar_sticky_button_normal_active = themedir .. "/titlebar/sticky_normal_active.png"
--theme.titlebar_sticky_button_focus_inactive  = themedir .. "/titlebar/sticky_focus_inactive.png"
--theme.titlebar_sticky_button_normal_inactive = themedir .. "/titlebar/sticky_normal_inactive.png"
--
--theme.titlebar_floating_button_focus_active  = themedir .. "/titlebar/floating_focus_active.png"
--theme.titlebar_floating_button_normal_active = themedir .. "/titlebar/floating_normal_active.png"
--theme.titlebar_floating_button_focus_inactive  = themedir .. "/titlebar/floating_focus_inactive.png"
--theme.titlebar_floating_button_normal_inactive = themedir .. "/titlebar/floating_normal_inactive.png"
--
--theme.titlebar_maximized_button_focus_active  = themedir .. "/titlebar/maximized_focus_active.png"
--theme.titlebar_maximized_button_normal_active = themedir .. "/titlebar/maximized_normal_active.png"
--theme.titlebar_maximized_button_focus_inactive  = themedir .. "/titlebar/maximized_focus_inactive.png"
--theme.titlebar_maximized_button_normal_inactive = themedir .. "/titlebar/maximized_normal_inactive.png"


return theme

