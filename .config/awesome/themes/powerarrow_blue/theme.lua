--[[
     Computerjerms Awesome WM theme
     github.com/computerjerms
--]]

		-- ~~~~~~~~~
		-- Libraries
		-- ~~~~~~~~~

local gears = require("gears")
local lain  = require("widgets.lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
-- local os = os
local awesome, client, math, string, os = awesome, client, math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local volume_widget = require('widgets.volume-widget.volume')
local logout_popup = require("widgets.logout-popup-widget.logout-popup")
local cpu_widget = require("widgets.cpu-widget.cpu-widget")
local brightness_widget = require("widgets.brightness-widget.brightness")
local batteryarc_widget = require("widgets.batteryarc-widget.batteryarc")
local net_widgets = require("widgets.net_widgets")
local net_wired = require("widgets.net_widgets.internet")
local spotify_shell = require("widgets.spotify-shell.spotify-shell")
local spotify_widget = require("widgets.spotify-widget.spotify")
-- local vicious = require("widgets.vicious")

--[[
	-- Awesome Taglist Letters (awesomewm-font)
		-- cool looking but breaks rules in rc.lua

--theme.taglist_font                            = "awesomewm-font 13"
--theme.taglist_fg_focus                        = "#39992af"
--theme.taglist_fg_occupied                     = "#164b6d"
--theme.taglist_fg_urgent                       = "#ED7572"
--theme.taglist_fg_empty                        = "#828282"
--theme.taglist_spacing                         = 2
--theme.taglist_bg_focus                          = "#060606"

--]]

--
-- POWERARROW BLUE THEME 
--


local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powearrow_blue"
--theme.wallpaper                                 = theme.dir .. "/starwars.jpg"
theme.font                                      = "Mononoki Nerd Font 9"
theme.taglist_font                              = "Droid Sans Bold 7"
theme.fg_normal                                 = "#ffffff"
theme.fg_focus                                  = "#A77AC4"
theme.fg_urgent                                 = "#b74822"
theme.bg_normal                                 = "#282a36"
theme.bg_focus                                  = "#FF79C6"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#282a36"
theme.tasklist_bg_focus                         = "#000000"
theme.tasklist_fg_focus                         = "#A77AC4"
theme.border_width                              = 2
theme.border_normal                             = "#282a36"
theme.border_focus                              = "#F07178"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons-powerarrow_blue/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons-powerarrow_blue/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons-powerarrow_blue/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-powerarrow_blue/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons-powerarrow_blue/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons-powerarrow_blue/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons-powerarrow_blue/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons-powerarrow_blue/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons-powerarrow_blue/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons-powerarrow_blue/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons-powerarrow_blue/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons-powerarrow_blue/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons-powerarrow_blue/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons-powerarrow_blue/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons-powerarrow_blue/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons-powerarrow_blue/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons-powerarrow_blue/ac.png"
theme.widget_battery                            = theme.dir .. "/icons-powerarrow_blue/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons-powerarrow_blue/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons-powerarrow_blue/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons-powerarrow_blue/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons-powerarrow_blue/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons-powerarrow_blue/temp.png"
theme.widget_net                                = theme.dir .. "/icons-powerarrow_blue/net.png"
theme.widget_hdd                                = theme.dir .. "/icons-powerarrow_blue/hdd.png"
theme.widget_music                              = theme.dir .. "/icons-powerarrow_blue/note.png"
theme.widget_music_on                           = theme.dir .. "/icons-powerarrow_blue/note.png"
theme.widget_music_pause                        = theme.dir .. "/icons-powerarrow_blue/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons-powerarrow_blue/stop.png"
theme.widget_vol                                = theme.dir .. "/icons-powerarrow_blue/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons-powerarrow_blue/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons-powerarrow_blue/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons-powerarrow_blue/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons-powerarrow_blue/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons-powerarrow_blue/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons-powerarrow_blue/task.png"
theme.widget_scissors                           = theme.dir .. "/icons-powerarrow_blue/scissors.png"
theme.widget_weather                            = theme.dir .. "/icons-powerarrow_blue/dish.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 4
theme.titlebar_close_button_focus               = theme.dir .. "/icons-powerarrow_blue/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons-powerarrow_blue/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons-powerarrow_blue/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons-powerarrow_blue/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons-powerarrow_blue/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons-powerarrow_blue/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons-powerarrow_blue/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons-powerarrow_blue/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons-powerarrow_blue/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons-powerarrow_blue/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons-powerarrow_blue/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons-powerarrow_blue/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons-powerarrow_blue/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons-powerarrow_blue/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons-powerarrow_blue/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons-powerarrow_blue/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons-powerarrow_blue/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons-powerarrow_blue/titlebar/maximized_normal_inactive.png"

--local markup = lain.util.markup
--local separators = lain.util.separators

--[[

  Volume Widget/Logout-Popup Widget have been altered in their
respective directories

-----------------------------------------------------------------
The Logout Popup widget is straight forward.. to change its color
back to white, edit the file
~/.config/awesome/widgets/logout-popup-widget/logout-popup.lua

-- cuurent (red)
local icon = args.icon or WIDGET_DIR .. '/power-red.svg'
-- white
local icon = args.icon or WIDGET_DIR .. '/power.svg'

                -- Read the script idea on the next blurb

-----------------------------------------------------------------
Volume widget is a little more of a jerk.. looking for a work around
edit the directory
~/.config/awesome/widgets/volume_widget/icons
1)delete all the files (not directories)
2)copy files from the directory "white" into the above mentioned directory

        -- hey ding dong.. make a script that does that for people (and you)
        so you can just click a script ex. change-logout-widget-to-red.sh
------------------------------------------------------------------
--]]

	-- Microphone

theme.widget_micMuted = theme.dir .. "icons/microphone-mute.png"
theme.widget_micUnmuted = theme.dir .. "icons/microphone.png"

	
local markup     = lain.util.markup
local separators = lain.util.separators

-- for lain widgets
local widgetcolor       = "#ff0000"
-- Gray "#9E9C9A"

local connection = require("scripts.mpc")


-- ~~~~~~~~~~~~~~~~~~~
-- Textclock/ Calendar
-- ~~~~~~~~~~~~~~~~~~~

local mytextclock = wibox.widget.textclock(" %H:%M ")
 mytextclock.font = theme.font
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- Calendar (attached to textclock)
	-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 11",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal,
        position = "bottom_right",
        font = "Monospace 11"

    }
})

-- ~~~~~~~~~~~~~~~
-- Mail IMAP check
-- ~~~~~~~~~~~~~~~

--[[

theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    notification_preset = { fg = white }
    settings = function()
        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "Mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(widgetcolor, mail) .. count))
    end
})

--]]



-- ~~~~~~~~~~~~~~~~~
-- Microphone Toggle
-- ~~~~~~~~~~~~~~~~~

--[[

local widgets = {
    mic = require("widgets/mic-widget/mic"),
}
theme.mic = widgets.mic({
    timeout = 10,
    settings = function(self)
        if self.state == "muted" then
            self.widget:set_image(theme.widget_micMuted)
        else
            self.widget:set_image(theme.widget_micUnmuted)
        end
    end
})
local widget_mic = wibox.widget { theme.mic.widget, layout = wibox.layout.align.horizontal }

--]]

-- ~~~~~~~~~~~~~
-- Network Wired
-- ~~~~~~~~~~~~~
--[[
	net_wired = net_widgets.indicator({
    interfaces  = {"enp2s0", "another_interface", "and_another_one"},
    timeout     = 5

        widget:set_markup(markup.font(theme.font, markup(widgetcolor, artist) .. title .. " "))
    end
})

--]]

-- ~~~~~~~
--   MPD #1 - Works
-- ~~~~~~~
theme.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset.fg = white
        artist = mpd_now.artist .. " "
        title  = mpd_now.title  .. " "

        if mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = " "
            title  = " "
        end

        widget:set_markup(markup.font(theme.font, markup(widgetcolor, artist) .. title .. " "))
--        widget:set_markup(markup(gmc.color['blue900'], artist)
--            .. markup(gmc.color['green900'], title)) 
   end
})


-- ~~~~~~~~~~~~~~
-- MPD#2 WORKING -- Shows track info.. no albulm art yet...
-- ~~~~~~~~~~~~~~
local awesompd = require("widgets/awesompd/awesompd")
 
   musicwidget = awesompd:create() -- Create awesompd widget
   musicwidget.font = "Liberation Mono" -- Set widget font
--    musicwidget.font_color = "#FFFFFF" --Set widget font color
--    musicwidget.background = "#000000" --Set widget background color
   musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
   musicwidget.output_size = 45 -- Set the size of widget in symbols
   musicwidget.update_interval = 10 -- Set the update interval in seconds

   -- Set the folder where icons are located (change username to your login name)
   musicwidget.path_to_icons = "/home/gopher/.config/awesome/widgets/awesompd/icons"

   -- Set the path to the icon to be displayed on the widget itself
    musicwidget.widget_icon = "/home/gopher/.config/awesome/widgets/awesomepd/icons"
-- musicwidget.widget_icon = "/home/gopher/music"
   -- Set the default music format for Jamendo streams. You can change
   -- this option on the fly in awesompd itself.
   -- possible formats: awesompd.FORMAT_MP3, awesompd.FORMAT_OGG
   musicwidget.jamendo_format = awesompd.FORMAT_MP3

   -- Specify the browser you use so awesompd can open links from
   -- Jamendo in it.
   musicwidget.browser = "firefox"

   -- If true, song notifications for Jamendo tracks and local tracks
   -- will also contain album cover image.
   musicwidget.show_album_cover = true

   -- Specify how big in pixels should an album cover be. Maximum value
   -- is 100.
   musicwidget.album_cover_size = 50

   -- This option is necessary if you want the album covers to be shown
   -- for your local tracks.
   musicwidget.mpd_config = "/home/gopher/.config/mpd/mpd.conf"

   -- Specify decorators on the left and the right side of the
   -- widget. Or just leave empty strings if you decorate the widget
   -- from outside.
   musicwidget.ldecorator = " &#9835; "
   musicwidget.rdecorator = " &#9835; "

   -- Set all the servers to work with (here can be any servers you use)
   musicwidget.servers = {
      { server = "localhost",
        port = 6600 },
--      { server = "192.168.0.72",
--        port = 6600 }

musicwidget:run()

 }

-- ~~~~~~~~~
-- /home fs
-- ~~~~~~~~~
-- commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = white, bg = theme.bg_normal, font = "Terminus 10.5" },
    settings  = function()
        fs_header = ""
        fs_p      = ""

        if fs_now["/home"].percentage >= 90 then
            fs_header = " Hdd "
            fs_p      = fs_now["/home"].percentage
        end

        widget:set_markup(markup.font(theme.font, markup(widgetcolor, fs_header) .. fs_p))
    end
})

-- ~~~~~~~~~~~~~~
-- Battery - Lain
-- ~~~~~~~~~~~~~~

--[[
-- Battery
local bat = lain.widget.bat({
    settings = function()
        bat_header = " Bat "
        bat_p      = bat_now.perc .. " "
        widget:set_markup(markup.font(theme.font, markup(widgetcolor, bat_header) .. bat_p))
    end
})
--]]

-- pulse bar
local pulsebar = lain.widget.pulsebar()
-- ~~~~~~~~~~~~~~
-- ALSA Volume - Lain
-- ~~~~~~~~~~~~~~

theme.volume = lain.widget.alsa({
    --togglechannel = "IEC958,3",
    settings = function()
        header = " Vol "
        vlevel  = volume_now.level

        if volume_now.status == "off" then
            vlevel = vlevel .. "M "
        else
            vlevel = vlevel .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(widgetcolor, header) .. vlevel))
    end
})


-- ~~~~~~~~~
--  Weather
-- ~~~~~~~~~

--[[ to be set before use
theme.weather = lain.widget.weather({
    --APPID =
    city_id = 2643743, -- placeholder (London)
    settings = function()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(" " .. units .. " ")
    end
})
--]]

-- ~~~~~~~--~~~~~~~~~~~
-- Net Wired (Ethernet) - Broken
-- ~~~~~~~~~~~~~~~~~~~~
net_wired = net_widgets.indicator({
    interfaces  = {"enp2s0", "another_interface", "and_another_one"},
    timeout     = 5
})

-- ~~~~~~~~~~~~
-- Net Wireless
-- ~~~~~~~~~~~~
net_wireless = require ("widgets.net_widgets.wireless")

-- ~~~~~~~~~~~~~~~~~~~~~~~~
-- Net Internet (indicator) - Broken
-- ~~~~~~~~~~~~~~~~~~~~~~~~
net_internet = net_widgets.internet({indent = 0, timeout = 5})

-- ~~~~~~~~~~
-- Separators
-- ~~~~~~~~~~
local first     = wibox.widget.textbox('<span font="Terminus 4"> </span>')
local space_1 = wibox.widget.textbox(" ")
local space_2 = wibox.widget.textbox("  ")
local space_3 = wibox.widget.textbox("   ")
local space_4 = wibox.widget.textbox("    ")
local arrl_pre  = separators.arrow_right("alpha", "#1A1A1A")
local arrl_post = separators.arrow_right("#1A1A1A", "alpha")

-- ~~~~~~~~~~~~~~~~~~~
-- Titlebar Height???? -  idk
-- ~~~~~~~~~~~~~~~~~~~
local barheight = dpi(18)
local barcolor  = gears.color({
    type  = "linear",
    from  = { barheight, 0 },
    to    = { barheight, barheight },
    stops = { {0, theme.bg_focus }, {0.8, theme.border_normal}, {1, "#1A1A1A"} }
})
theme.titlebar_bg = barcolor

theme.titlebar_bg_focus = gears.color({
    type  = "linear",
    from  = { barheight, 0 },
    to    = { barheight, barheight },
    stops = { {0, theme.bg_normal}, {0.5, theme.border_normal}, {1, "#492417"} }
})

-- ~~~~~~~~~~~~~~~~
-- ??????
-- ~~~~~~~~~~~~~~~~
function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~ Lets finish this shit ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- ~~~~~~~~~~
-- Tag Layout
-- ~~~~~~~~~~

			-- Standard

	-- awful.tag(awful.util.tagnames, s, awful.layout.layouts)


			-- Tags 1-8: Tile; 9: Floating

	awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
	local l = awful.layout.suit
	local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.floating }
	awful.tag(awful.util.tagnames, s, layouts)

-- ~~~~~~~~~		
-- Promptbox
-- ~~~~~~~~~
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

-- ~~~~~~~~~
-- Imagebox
-- ---------
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

-- ~~~~~~~~~-----
-- Taglist Widget
-- ~~~~~~~~~~----
     s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

-- ~~~~~~~~~~~~~~~
-- Tasklist Widget
-- ~~~~~~~~~~~~~~~
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_normal = barcolor, bg_focus = barcolor })

-- ~~~~~~~~~~~~
-- Create Wibox
-- ~~~~~~~~~~~~
    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = dpi(40), bg = barcolor })


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~ Add Widgets to the Wibox ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,

--	      ___  ___ ___            __   __   ___ ___  __  
--	|    |__  |__   |     |  | | |  \ / _` |__   |  /__` 
--	|___ |___ |     |     |/\| | |__/ \__> |___  |  .__/ 


{
	    
mylauncher,
layout = wibox.layout.fixed.horizontal,
            
space_2,

	-- ~~~~~~~~~
	--  Taglist
	-- ~~~~~~~~~

s.mytaglist,   
space_2,

        -- ~~~~~~~~
        --   MPD
        -- ~~~~~~~~
arrl_pre,
arrl_post,
space_4,
theme.mpd.widget,
musicwidget,
arrl_pre,
arrl_post,
space_4,

        -- ~~~~~~~~
        -- Spotify
        -- ~~~~~~~~

spotify_widget({
    font = 'Ubuntu Mono 9',
    play_icon = '/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg',
    pause_icon = '/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg',
    dim_when_paused = true,
    dim_opacity = 0.5,
    max_length = -1,
    show_tooltip = false
}),
	
	-- ~~~~~~~~~~~~
	--  Prompt Box
	-- ~~~~~~~~~~~~

s.mypromptbox,      


},


--	        __   __        ___            __   __   ___ ___  __  
-- 	|\/| | |  \ |  \ |    |__     |  | | |  \ / _` |__   |  /__` 
-- 	|  | | |__/ |__/ |___ |___    |/\| | |__/ \__> |___  |  .__/ 


s.mytasklist,

--	 __     __       ___            __   __   ___ ___  __  
--	|__) | / _` |__|  |     |  | | |  \ / _` |__   |  /__` 
--	|  \ | \__> |  |  |     |/\| | |__/ \__> |___  |  .__/ 
                                                       
        
{ 

layout = wibox.layout.fixed.horizontal,

        -- ~~~~~~~~
        --   CPU
        -- ~~~~~~~~

cpu_widget({
width = 20,
step_width = 2,
step_spacing = 0,
--color = '#FFFFFF'      -- white
--color = '#32FF00'      -- green
color = '#ff0000'        --red
}),

space_1,

	-- ~~~~~~~~~
	--  Systray
	-- ~~~~~~~~~

wibox.widget.systray(),

space_1,

	-- ~~~~~~~~
	--  Volume
	-- ~~~~~~~~

volume_widget(), -- awesome-wm-widgets	

space_4,

	-- ~~~~~~~~~~~~
	--  Brightness
	-- ~~~~~~~~~~~~

brightness_widget({
program = 'light',
base = 100,
tooltip = true,
step = 5
}),

space_4,

	-- ~~~~~~~~~
	--  Battery
	-- ~~~~~~~~~

--batteryarc_widget(),

batteryarc_widget({
show_current_level = true,
arc_thickness = 2,
warning_msg_position = bottom_right,
show_notification_mode = on_hover,
warning_msg_title = "yo, go find your charger",
position = "bottom_right",
size = 22
}),

space_3,

	-- ~~~~~~~~~
	-- Textclock
	-- ~~~~~~~~~

mytextclock,
space_2,


        -- ~~~~~~~~~~
        --  Layouts
        -- ~~~~~~~~~~


s.mylayoutbox,



space_1,

	-- ~~~~~~~~~
	--  Logout
	-- ~~~~~~~~~

logout_popup.widget{},
space_2,
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		-- ~~~~~~~~~~~~~~
		-- Unused Widgets
		-- ~~~~~~~~~~~~~~

--bat, 			-- lain
--brightness_widget(),  -- awesome-wm-widgets
--cpu_widget(),		-- awesome-wm-widgets
--net_wireless(),	-- awesome-wm-widgets
--net_wired(),		-- awesome-wm-widgets
--net_internet(),	-- awesome-wm-widgets
--widget_mic,		
--theme.mail.widget,	-- lain
--theme.weather.icon,	-- lain
--theme.weather.widget, -- lain
--theme.fs.widget,      -- lain
--theme.volume.widget,  -- lain

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

},

}
end


-- 2nd wibar, anyone?

--[[
    -- Create the bottom wibox
    s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = dpi(0), height = dpi(32) })
    s.borderwibox = awful.wibar({ position = "bottom", screen = s, height = dpi(1), bg = theme.fg_focus, x = dpi(0), y = dpi(33)})

    -- Add widgets to the bottom wibox
    s.mybottomwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr_bottom_right,
            netdown_icon,
            networkwidget,
            netup_icon,
            bottom_bar,
            cpu_icon,
            cpuwidget,
            bottom_bar,
            calendar_icon,
            calendarwidget,
            bottom_bar,
            clock_icon,
            clockwidget,
        },
    }
end
--]]


return theme
