
--[[
                                     
     Steamburn Awesome WM config 3.0 
     github.com/copycat-killer       
                                     
--]]

theme                               = {}

themes_dir                          = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
theme.wallpaper                     = themes_dir .. "/wall.png"

--theme.font                          = "Tamsyn Mono 11"
theme.font                          = "Ubuntu Mono 11"
theme.fg_normal                     = "#e2ccb0"
theme.fg_focus                      = "#d88166"
theme.fg_urgent                     = "#8cdd81"
theme.bg_normal                     = "#140c0b"
theme.bg_focus                      = "#140c0b"
theme.bg_urgent                     = "#140c0b"
theme.border_width                  = 2
theme.border_normal                 = "#302627"
theme.border_focus                  = "#c2745b"
theme.border_marked                 = "#CC9393"
theme.taglist_fg_focus              = "#d88166"
theme.tasklist_bg_focus             = "#140c0b"
theme.tasklist_fg_focus             = "#d88166"
theme.menu_height                   = "20"
theme.menu_width                    = "140"

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

theme.menu_submenu_icon             = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/icons/square_unsel.png"

theme.tasklist_disable_icon         = false
theme.tasklist_floating             = ""

orange 	= "#f1af5f"
red 	= "#de5e1e"
blue 	= "#7788af"

return theme
