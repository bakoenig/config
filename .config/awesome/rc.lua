-- Standard awesome library
local gears 	= require("gears")
local awful 	= require("awful")
awful.rules 	= require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox 	= require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty 	= require("naughty")
local menubar 	= require("menubar")
local lain    	= require("lain")


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
--beautiful.init("/usr/share/awesome/themes/default/theme.lua")
beautiful.init("/home/bkoenig/.config/awesome/themes/steamburn/theme.lua")
-- other themes: blackburn, sand, orbit, steamburn, wombat

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = "vim"
file_browser = "pcmanfm"
gui_editor = "gvim"
www_browser = "firefox"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
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

-- {{{ Variable definitions
-- localization
--os.setlocale(os.getenv("LANG"))

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ " Αα1 " , " Ββ2 " , " Γγ3 " , " Δδ4 " , " Ωω800 " }, s,
    { layouts[1] , layouts[8] , layouts[1] , layouts[1] , layouts[5] })
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

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, theme.awesome_icon },
                                    { "Open Terminal", terminal },
									{ "Chromium", "chromium" },
									{ "Firefox", "firefox" }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox

markup = lain.util.markup

-- Weather
--yawn = lain.widgets.yawn(12835699,
--{
--    settings = function()
--        widget:set_markup(" " .. units .. "°C")
--    end
--})

-- Battery
batwidget = lain.widgets.bat({
        battery = "BAT1",
--		notify = "off",
		settings = function()
        	bat_perc = bat_now.perc
                if bat_now.status == "Discharging" then
        	widget:set_markup( " Bat " .. markup(red, bat_perc) )
                else
	        widget:set_markup( " Bat " .. markup(blue, bat_perc) )
                end
    	end
})

-- Net checker
netwidget = lain.widgets.net({
    settings = function()
        if net_now.state == "up" then net_state = "On"
        else net_state = "Off" end
        widget:set_markup( "Net " .. net_state )
    end
})

-- Coretemp widget
tempwidget = wibox.widget.textbox()
function update_temp()
        local f = io.open("/sys/class/thermal/thermal_zone0/temp")
        coretemp_now = tonumber(f:read("*all")) / 1000
        f:close()
    end
update_temp(tempwidget)
mytimer = timer({ timeout = 10 })
mytimer:connect_signal("timeout", function () update_temp(tempwidget) end)
tempwidget:set_markup(markup(orange, coretemp_now .. "°C"))
mytimer:start()

-- Create a textclock widget
mytextclock = awful.widget.textclock(markup(blue, "%a %d %b") .. " " .. markup(red, "%H:%M") .. " ")
mytextclock:buttons(awful.util.table.join(awful.button({ }, 3, function () awful.util.spawn_with_shell("urxvt -e sh ~/bin/calendar.sh") end)))

-- Volume widget
volwidget = awful.widget.progressbar()
volmargin = wibox.layout.margin(volwidget)
volwidget:set_width(11)
volwidget:set_vertical(true)
volwidget:set_ticks(true)
volmargin:set_top(1)
volmargin:set_bottom(1)
volwidget:set_background_color("#123456")

function update_volume(widget)
   local fd = io.popen("amixer sget Master")
   local status = fd:read("*all")
   fd:close()
   local volume = string.match(status, "(%d?%d?%d)%%")
   volume = string.format("% 3d", volume)
   status = string.match(status, "%[(o[^%]]*)%]")
   volwidget:set_value(volume/100)
   if string.find(status, "on", 1, true) then
       -- if unmuted
	   volwidget:set_color("#66a266")
   else
       -- if muted
	   volwidget:set_color()
   end
end
update_volume(volwidget)
mytimer = timer({ timeout = 2 })
mytimer:connect_signal("timeout", function () update_volume(volwidget) end)
mytimer:start()

volwidget:buttons(awful.util.table.join(
--awful.button({ }, 2, function ()
--awful.util.spawn_with_shell("urxvt -e alsamixer") end),
awful.button({ }, 3, function ()
awful.util.spawn_with_shell("amixer set Master toggle") end),
awful.button({ }, 4, function ()
awful.util.spawn("amixer set Master 2%+") end),
awful.button({ }, 5, function ()
awful.util.spawn("amixer set Master 2%-") end)
))

-- Separators
spacer = wibox.widget.textbox("  ")
separator = wibox.widget.textbox(" | ")
arrow = wibox.widget.textbox(" >> ")
slash = wibox.widget.textbox(" // ")

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
txtlayoutbox = {}
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

    mypromptbox[s] = awful.widget.prompt()
    mylayoutbox[s] = awful.widget.layoutbox(s)
	
-- Writes a string representation of the current layout in a textbox widget
function updatelayoutbox(layout, s)
    local screen = s or 1
    local txt_l = beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(screen))] or ""
    layout:set_text(txt_l)
end

    -- Create a textbox widget which will contains a short string representing the
    -- layout we're using.  We need one layoutbox per screen.
    txtlayoutbox[s] = wibox.widget.textbox(beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function ()
        updatelayoutbox(txtlayoutbox[s], s)
    end)
    awful.tag.attached_connect_signal(s, "property::layout", function ()
        updatelayoutbox(txtlayoutbox[s], s)
    end)

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({
	position = "top",
	--height = 25, 
	screen = s,
	bg= theme.bg_wibox
	})

	-- make sure that systray has same background color as wibox
	theme.bg_systray = theme.bg_wibox

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(separator)
    left_layout:add(txtlayoutbox[s])
    left_layout:add(arrow)
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(arrow)
    right_layout:add(netwidget)
	--if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(separator)
    right_layout:add(tempwidget)
    right_layout:add(batwidget)
    right_layout:add(separator)
    right_layout:add(volmargin)
    right_layout:add(separator)
    --right_layout:add(yawn.icon)
    --right_layout:add(yawn.widget)
	--right_layout:add(spacer)
    right_layout:add(mytextclock)

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
    awful.key({ modkey,           }, "Left", awful.tag.viewprev),
    awful.key({ modkey,           }, "Right", awful.tag.viewnext),
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
    --awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    --awful.key({ modkey,           }, "Tab",
    --    function ()
    --        awful.client.focus.history.previous()
    --        if client.focus then
    --            client.focus:raise()
    --        end
    --    end),

    -- Standard keys
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey,           }, "b", function () awful.util.spawn( file_browser ) end),
    awful.key({ modkey,           }, "c", function () awful.util.spawn( "chromium" ) end),
    awful.key({ modkey,           }, "v", function () awful.util.spawn( gui_editor ) end),
    awful.key({ modkey,           }, "x", function () awful.util.spawn( www_browser) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    -- Show clients on modkey "-"
	awful.key({ modkey,			  }, "-", function () instance = awful.menu.clients({ width=250 }) end),

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
    -- awful.key({ modkey }, "r",     function () mypromptbox[mouse.screen]:run() end),

    -- awful.key({ modkey }, "x",
    awful.key({ modkey }, "r",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "w", function() menubar.show() end),
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
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set applications to always map on certain tags
    { rule = { class = "Chromium" }, properties = { tag = tags[1][2] } },
    { rule = { class = "Firefox" }, properties = { tag = tags[1][2] } },
    { rule = { class = "Opera" }, properties = { tag = tags[1][2] } },
    { rule = { class = "Pcmanfm" }, properties = { tag = tags[1][3] } },
    { rule = { class = "Nautilus" }, properties = { tag = tags[1][3] } },
    { rule = { class = "Spacefm" }, properties = { tag = tags[1][3] } },
	{ rule = { class = "Vlc" }, properties = { tag = tags[1][5] } },
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
	-- Set proper backgrounds, instead of beautiful.bg_normal
    --mywibox[s]:set_bg(beautiful.topbar_path .. screen[mouse.screen].workarea.width .. ".png")
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{Autorun
--awful.util.spawn_with_shell(terminal)
--awful.util.spawn_with_shell("sleep 2; volumeicon")
-- }}}
