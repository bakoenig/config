-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

vicious = require("vicious")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
--beautiful.init("/usr/share/awesome/themes/zenburn/theme.lua")
<<<<<<< HEAD
beautiful.init("/home/bernhard/.config/awesome/themes/dunzor/theme.lua")
=======
beautiful.init("/home/bernhard/.config/awesome/themes/sand/theme.lua")
-- other themes: crown, dunzor, dust, grey-new, wombat, zenburn
>>>>>>> 4a631a363e9d2b12eeea587f95fc92c148e48afe

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
file_manager = "thunar"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
--    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
--    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
--    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ " term " , " www " , " files " , " edit " , " media " }, s, 
    { layouts[2] , layouts[6] , layouts[2] , layouts[3] , layouts[2] })
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
mysessionmenu = {
	{ "logout", awesome.quit },
	{ "reboot", "systemctl reboot" },
	{ "shutdown", "systemctl poweroff" }
}
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "session", mysessionmenu }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox

-- Separators
spacer = wibox.widget.textbox(" ")
separator = wibox.widget.textbox("|")

-- Network usage widget
<<<<<<< HEAD
netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, '<span color="#FFA500"> Dn ${wlp4s0 down_kb}</span> <span color="#7F9F7F">Up ${wlp4s0 up_kb}</span>', 7)
=======
downwidget = wibox.widget.textbox()
vicious.register(downwidget, vicious.widgets.net, '<span color="#75b919">${wlp9s0 down_kb}</span>', 5)
upwidget = wibox.widget.textbox()
vicious.register(upwidget, vicious.widgets.net, '<span color="#5785bc">${wlp9s0 up_kb}</span>', 5)

>>>>>>> 4a631a363e9d2b12eeea587f95fc92c148e48afe
-- Memory usage widget
--memwidget = wibox.widget.textbox()
--vicious.register(memwidget, vicious.widgets.mem, " RAM: $1%", 13)
--memwidget:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("urxvt -e htop -s PERCENT_MEM") end)))

-- CPU usage widget
cpuwidget = awful.widget.graph()
cpuwidget:set_width(50)
cpuwidget:set_color("linear:0,0:0,20:0,#ff0000:1,#00ff00")
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")
cpuwidget:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("urxvt -e htop -s PERCENT_CPU") end)))

-- CPU temperature
thermalwidget = wibox.widget.textbox() vicious.register(thermalwidget, vicious.widgets.thermal, '<span color="#FF0000"> $1°C</span>', 13, { "coretemp.0", "core"})

-- Battery widget
batwidget = wibox.widget.textbox() vicious.register(batwidget, vicious.widgets.bat, '<span color="#28619d">$2%</span>', 60, "BAT1")

-- Create a textclock widget
mytextclock = awful.widget.textclock() mytextclock:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("urxvt -e sh ~/bin/calendar.sh") end)))

-- Volume widget
volwidget = awful.widget.progressbar()
volwidget:set_width(15)
--volwidget:set_height(30)
volwidget:set_vertical(true)
volwidget:set_color("linear:0,0:0,20:0,#ffa500:1,#800000")
vicious.register(volwidget, vicious.widgets.volume, "$1", 1, "Master")
volwidget:buttons(awful.util.table.join(
awful.button({ }, 3, function ()
awful.util.spawn_with_shell("urxvt -e alsamixer") end),
awful.button({ }, 4, function ()
awful.util.spawn("amixer set Master 2%+") end),
awful.button({ }, 5, function ()
awful.util.spawn("amixer set Master 2%-") end)
))


mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                                  client.focus = c
                                                  c:raise()
                                          end),
                     awful.button({ }, 2, function (c)
                                                  c:kill()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end)
					  )

for s = 1, screen.count() do

	updownicon = wibox.widget.imagebox()
 	updownicon:set_image(awful.util.getdir("config") .. "/icons/transfer.png")
	baticon = wibox.widget.imagebox()
	baticon:set_image(awful.util.getdir("config") .. "/icons/battery.png")
	cpuicon = wibox.widget.imagebox()
	cpuicon:set_image(awful.util.getdir("config") .. "/icons/cpu.png")


    mypromptbox[s] = awful.widget.prompt()
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top",
	--height = 25, 
	screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(separator)
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
			right_layout:add(spacer)
    right_layout:add(downwidget)
    right_layout:add(updownicon)
	right_layout:add(upwidget)
    right_layout:add(spacer)
    right_layout:add(cpuwidget)
    right_layout:add(spacer)
	right_layout:add(cpuicon)
    right_layout:add(thermalwidget)
	right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(spacer)
    right_layout:add(volwidget)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])
--  right_layout:add(mylauncher)

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
    --awful.button({ }, 4, awful.tag.viewnext),
    --awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Prior",   awful.tag.viewprev),
    awful.key({ modkey,           }, "Next",  awful.tag.viewnext),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard keys
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey,           }, "c", function () awful.util.spawn("chromium") end),
    awful.key({ modkey,           }, "f", function () awful.util.spawn("firefox") end),
    awful.key({ modkey,           }, "p", function () awful.util.spawn( file_manager ) end),
    awful.key({ modkey,           }, "v", function () awful.util.spawn("gvim") end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    -- Show menu on modkey + "-"
    awful.key({ modkey,		  }, "-", function () instance = awful.menu.clients({ width=250 }) end),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey }, "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "u", function() menubar.show() end),
    awful.key({ modkey }, "+", function() awful.util.spawn("dmenu_run") end),
    awful.key({ }, "XF86AudioRaiseVolume", function ()
       awful.util.spawn("amixer set Master 9%+") end),
    awful.key({ }, "XF86AudioLowerVolume", function ()
       awful.util.spawn("amixer set Master 9%-") end),
    awful.key({ }, "XF86AudioMute", function ()
       awful.util.spawn("amixer sset Master toggle") end)
)

clientkeys = awful.util.table.join(
    --awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))


-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set applications to always map on certain tags
    { rule = { class = "Chromium" }, properties = { tag = tags[1][2] } },
    { rule = { class = "Firefox" }, properties = { tag = tags[1][2] } },
    { rule = { class = "Pcmanfm" }, properties = { tag = tags[1][3] } },
    { rule = { class = "Thunar" }, properties = { tag = tags[1][3] } },
    { rule = { class = "Spacefm" }, properties = { tag = tags[1][3] } },
--  { rule = { class = "Smplayer" }, properties = { tag = tags[1][5] } },
    { rule = { class = "Rhythmbox" }, properties = { tag = tags[1][5] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{Autorun
awful.util.spawn_with_shell("nm-applet")
--awful.util.spawn_with_shell("sleep 2; volumeicon")
-- }}}
