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
-- VERTEX THEME
--


local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/vertex"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/vertex/icons-vertex"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/vertex/wallpaper/wall-vertex.png"
theme.font                                      = "Roboto Bold 10"
theme.taglist_font                              = "FontAwesome 17"
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#6A95EB"
theme.bg_focus                                  = "#303030"
theme.bg_focus2                                 = "#3762B8"
theme.bg_normal                                 = "#242424"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"
theme.border_width                              = dpi(4)
theme.border_normal                             = "#252525"
theme.border_focus                              = "#7CA2EE"
theme.tooltip_border_color                      = theme.fg_focus
theme.tooltip_border_width                      = theme.border_width
theme.menu_height                               = dpi(24)
theme.menu_width                                = dpi(140)
theme.awesome_icon                              = theme.icon_dir .. "/awesome.png"
theme.taglist_squares_sel                       = gears.surface.load_from_shape(dpi(3), dpi(30), gears.shape.rectangle, theme.fg_focus)
theme.taglist_squares_unsel                     = gears.surface.load_from_shape(dpi(3), dpi(30), gears.shape.rectangle, theme.bg_focus2)
theme.panelbg                                   = theme.icon_dir .. "/panel.png"
theme.bat000charging                            = theme.icon_dir .. "/bat-000-charging.png"
theme.bat000                                    = theme.icon_dir .. "/bat-000.png"
theme.bat020charging                            = theme.icon_dir .. "/bat-020-charging.png"
theme.bat020                                    = theme.icon_dir .. "/bat-020.png"
theme.bat040charging                            = theme.icon_dir .. "/bat-040-charging.png"
theme.bat040                                    = theme.icon_dir .. "/bat-040.png"
theme.bat060charging                            = theme.icon_dir .. "/bat-060-charging.png"
theme.bat060                                    = theme.icon_dir .. "/bat-060.png"
theme.bat080charging                            = theme.icon_dir .. "/bat-080-charging.png"
theme.bat080                                    = theme.icon_dir .. "/bat-080.png"
theme.bat100charging                            = theme.icon_dir .. "/bat-100-charging.png"
theme.bat100                                    = theme.icon_dir .. "/bat-100.png"
theme.batcharged                                = theme.icon_dir .. "/bat-charged.png"
theme.ethon                                     = theme.icon_dir .. "/ethernet-connected.png"
theme.ethoff                                    = theme.icon_dir .. "/ethernet-disconnected.png"
theme.volhigh                                   = theme.icon_dir .. "/volume-high.png"
theme.vollow                                    = theme.icon_dir .. "/volume-low.png"
theme.volmed                                    = theme.icon_dir .. "/volume-medium.png"
theme.volmutedblocked                           = theme.icon_dir .. "/volume-muted-blocked.png"
theme.volmuted                                  = theme.icon_dir .. "/volume-muted.png"
theme.voloff                                    = theme.icon_dir .. "/volume-off.png"
theme.wifidisc                                  = theme.icon_dir .. "/wireless-disconnected.png"
theme.wififull                                  = theme.icon_dir .. "/wireless-full.png"
theme.wifihigh                                  = theme.icon_dir .. "/wireless-high.png"
theme.wifilow                                   = theme.icon_dir .. "/wireless-low.png"
theme.wifimed                                   = theme.icon_dir .. "/wireless-medium.png"
theme.wifinone                                  = theme.icon_dir .. "/wireless-none.png"
theme.layout_fairh                              = theme.default_dir.."/layouts/fairhw.png"
theme.layout_fairv                              = theme.default_dir.."/layouts/fairvw.png"
theme.layout_floating                           = theme.default_dir.."/layouts/floatingw.png"
theme.layout_magnifier                          = theme.default_dir.."/layouts/magnifierw.png"
theme.layout_max                                = theme.default_dir.."/layouts/maxw.png"
theme.layout_fullscreen                         = theme.default_dir.."/layouts/fullscreenw.png"
theme.layout_tilebottom                         = theme.default_dir.."/layouts/tilebottomw.png"
theme.layout_tileleft                           = theme.default_dir.."/layouts/tileleftw.png"
theme.layout_tile                               = theme.default_dir.."/layouts/tilew.png"
theme.layout_tiletop                            = theme.default_dir.."/layouts/tiletopw.png"
theme.layout_spiral                             = theme.default_dir.."/layouts/spiralw.png"
theme.layout_dwindle                            = theme.default_dir.."/layouts/dwindlew.png"
theme.layout_cornernw                           = theme.default_dir.."/layouts/cornernww.png"
theme.layout_cornerne                           = theme.default_dir.."/layouts/cornernew.png"
theme.layout_cornersw                           = theme.default_dir.."/layouts/cornersww.png"
theme.layout_cornerse                           = theme.default_dir.."/layouts/cornersew.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(10)
theme.titlebar_close_button_normal              = theme.default_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.default_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.default_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.default_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.default_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.default_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.default_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.default_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.default_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.default_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.default_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.default_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.default_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.default_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.default_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.default_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.default_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.default_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.default_dir.."/titlebar/maximized_focus_active.png"

-- http://fontawesome.io/cheatsheet
--awful.util.tagnames = { "", "", "", "", "", "", "", "" }

--local markup = lain.util.markup

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
