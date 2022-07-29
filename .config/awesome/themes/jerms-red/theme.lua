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

--
-- MY THEME
--

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/jerms-red"
theme.wallpaper                                 = theme.dir .. "/wall.png"
--theme.wallpaper					= os.getenv("HOME") .. "/.config/awesome/themes/jerms-red/nitrogen-jerms-red.sh"
theme.font                                      = "Terminus 10.5"

		-- ~~~~~~~~~~~~
		-- Theme Colors
		-- ~~~~~~~~~~~~

theme.fg_normal                                 = "#D7D7D7"
theme.fg_focus                                  = "#ff0000"
theme.bg_normal                                 = "#181818"  -- systray color
theme.bg_focus                                  = "#060606"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#2A1F1E"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#0E0E0E"
theme.border_focus                              = "#F79372"
-- theme.beautiful.systray_icon_spacing		= 4 -- BREAKS AWESOME
-- ~~~~~~~~~~~~~~~~~~
-- Awesome Wibar Icon
-- ~~~~~~~~~~~~~~~~~~
theme.awesome_icon                              = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/awesome-red.png"


-- ~~~~~~~~~
--  Taglist
-- ~~~~~~~~~

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

	-- Regular Taglist

theme.taglist_font                              = "Icons 11"
theme.taglist_fg_focus                          = "#ff0000"
theme.taglist_squares_sel                       = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/square_sel-red.png"
theme.taglist_squares_unsel                     = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/square_unsel-white.png"
theme.taglist_fg_urgent                         = "#aaff00"
theme.taglist_spacing                           = 5

-- ~~~~~~~~
-- Tasklist
-- ~~~~~~~~
theme.tasklist_fg_focus                         = "#ffffff"
theme.tasklist_bg_focus                         = "#060606"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false

-- ~~~~~~~
--   Menu 
-- ~~~~~~~
theme.menu_height                               = dpi(27)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/submenu.png"

-- ~~~~~~~~~~~~~~~~~
-- Layout Icon Theme
-- ~~~~~~~~~~~~~~~~~
theme.layout_tile                               = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/tile-red.png"
theme.layout_tileleft                           = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/tileleft.png"
theme.layout_tilebottom                         = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/tilebottom.png"
theme.layout_tiletop                            = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/tiletop.png"
theme.layout_fairv                              = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/fairv.png"
theme.layout_fairh                              = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/fairh.png"
theme.layout_spiral                             = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/spiral.png"
theme.layout_dwindle                            = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/dwindle.png"
theme.layout_max                                = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/max-red.png"
theme.layout_fullscreen                         = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/fullscreen.png"
theme.layout_magnifier                          = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/magnifier.png"
theme.layout_floating                           = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/floating-red.png"

-- ~~~~~~~~~~~~~~~~~~
-- Window Border Gaps
-- ~~~~~~~~~~~~~~~~~~
theme.useless_gap                               = "4"

-- ~~~~~~~~~~~~~~
-- Titlebar Theme
-- ~~~~~~~~~~~~~~
theme.titlebar_close_button_focus               = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = os.getenv("HOME") .. "/.config/awesome/icons/theme/icons-jerms-red/titlebar/maximized_normal_inactive.png"


-- http://fontawesome.io/cheatsheet
--awful.util.tagnames = { "", "", "", "", "", "", "", "" }

--local markup = lain.util.markup

--]]


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
local black = "#000000"
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
	music_dir = "~/music"
-- ~~~~~~~~
-- Comment if you want notifications
	mpd_notification_preset = { title = "", timeout = 1 }
-- ~~~~~~~~
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
-- MPD#2 WORKING -- Shows track info.. no album art yet...
-- ~~~~~~~~~~~~~~
local awesompd = require("widgets/awesompd/awesompd")
 
   musicwidget = awesompd:create() -- Create awesompd widget
   musicwidget.font = "Liberation Mono" -- Set widget font
--    musicwidget.font_color = "#FFFFFF" --Set widget font color
--    musicwidget.background = "#000000" --Set widget background color
   musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
   musicwidget.output_size = 45 -- Set the size of widget in symbols
--   musicwidget.output_size = 1 -- Set the size of widget in symbols
   musicwidget.update_interval = 10 -- Set the update interval in seconds

   -- Set the folder where icons are located (change username to your login name)
   musicwidget.path_to_icons = "/home/arch-user/.config/awesome/widgets/awesompd/icons"

   -- Set the path to the icon to be displayed on the widget itself
--    musicwidget.widget_icon = "/home/arch-user/.config/awesome/widgets/awesomepd/icons"
 musicwidget.widget_icon = "/home/arch-user/music"
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
   musicwidget.mpd_config = "/home/arch-user/.config/mpd/mpd.conf"

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
local space_100 = wibox.widget.textbox("                                                                                                   ")
local space_50 = wibox.widget.textbox("                                                  ")
local space_25 = wibox.widget.textbox("                         ")
local space_10 = wibox.widget.textbox("          ")
local arrl_pre  = separators.arrow_right("alpha", "#1A1A1A")
local arrl_post = separators.arrow_right("#1A1A1A", "alpha")

-- ~~~~~~~~~~~~~~
-- Custom Systray Red BG
-- ~~~~~~~~~~~~~~
local custom_systray_red = wibox.widget {
    {
        wibox.widget.systray(),
        left   = 5,
        top    = 4,
        bottom = 4,
        right  = 5,
        widget = wibox.container.margin,
    },
--    bg         = "#ff0000",
    shape      = gears.shape.rounded_rect,
    shape_clip = true,
    widget     = wibox.container.background,
}

-- ~~~~~~~~~~~~~~
-- Custom Systray
-- ~~~~~~~~~~~~~~
local custom_systray = wibox.widget {
    {
        wibox.widget.systray(),
        left   = 10,
        top    = 2,
        bottom = 2,
        right  = 10,
        widget = wibox.container.margin,
    },
    bg         = "#ff0000",
    shape      = gears.shape.rounded_rect,
    shape_clip = true,
    widget     = wibox.container.background,
}


-- ~~~~~~~~~~~~~~~~~~~~~
-- Custom Brightness Widget
-- ~~~~~~~~~~~~~~~~~~~~~
local custom_brightness = wibox.widget {
    {
        brightness_widget({
        program = 'light',
        base = 100,
        tooltip = true,
        step = 5
        }),
        left   = 10,
        top    = 2,
        bottom = 2,
        right  = 10,
        widget = wibox.container.margin,
    },
    bg         = "#ff0000",
--#710000",
    shape      = gears.shape.rounded_rect,
    shape_clip = true,
    widget     = wibox.container.background,
}


-- ~~~~~~~~~~~~~~~~~~~~~
-- Custom Battery  Widget
-- ~~~~~~~~~~~~~~~~~~~~~
--[[
local custom_battery = wibox.widget {
    {
	batteryarc_widget({
        show_current_level = true,
        arc_thickness = 2,
        warning_msg_position = bottom_right,
        show_notification_mode = on_hover,
        warning_msg_title = "yo, go find your charger",
        position = "bottom_right",
        size = 22
        }),
	left   = 5,
        top    = 1,
        bottom = 1,
        right  = 5,
        widget = wibox.container.margin,
    },
    bg         = "#ff0000",
--#710000",
    shape      = gears.shape.rounded_rect,
    shape_clip = true,
    widget     = wibox.container.background,
}
--]]
-- ~~~~~~~~~~~~~~~~~~~~~
-- Custom Textclock Widget
-- ~~~~~~~~~~~~~~~~~~~~~  
local custom_textclock = wibox.widget {
    {
        mytextclock,
        left   = 3,
        top    = 4,
        bottom = 4,
        right  = 3,
        widget = wibox.container.margin,
    },
    bg         = "#ff0000",
    shape      = gears.shape.rounded_rect,
    shape_clip = true,
    widget     = wibox.container.background,
}










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
	local layouts = { l.tile, l.max, l.tile, l.tile, l.tile, l.tile, l.floating, l.tile, l.floating }
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


-- ~~~~~~~~~~~~~~~~~
-- Create Top Wibox
-- ~~~~~~~~~~~~~~~~~
    s.mytopwibox = awful.wibar({ position = "top", screen = s, border_width = dpi(0), height = dpi(32) })
    s.topborderwibox = awful.wibar({ position = "top", screen = s, height = dpi(1), bg = theme.fg_focus, x = dpi(0), y = dpi(33)})

   -- Add widgets to the top wibox
    s.mytopwibox:setup {
        layout = wibox.layout.align.horizontal,
  
  -- ~~~~~~~~~~~~
  -- Left widgets
  -- ~~~~~~~~~~~~

	{
            
     layout = wibox.layout.fixed.horizontal,

        space_2,
        s.mytaglist,
        space_3,

        s.mylayoutbox,

-- Prompt Box
     
        s.mypromptbox,

        },

  -- ~~~~~~~~~~~~~
  -- Middle Widget
  -- ~~~~~~~~~~~~~
	
        s.mytasklist,

        { 

  -- ~~~~~~~~~~~~~
  -- Right widgets
  -- ~~~~~~~~~~~~~
            layout = wibox.layout.fixed.horizontal,

-- Brightness - awesome-wm-widgets

	brightness_widget({
	program = 'light',
	base = 100,
	tooltip = true,
	step = 5
	}),
	
	space_4,

-- Volume - awesome-wm-widgets
        volume_widget(),
        space_4,

-- Battery - awesome-wm-widgets

batteryarc_widget({


	font = "Play 6",
	arc_thickness = 2,
        show_current_level = true,
	size = 22,
	timeout = 10,
	show_notification_mode = "on_hover",

	bg_color = '#ffffff',
	low_level_color = '#e53935',
	medium_level_color = '#c0ca33',
	charging_color = '#43a047',

	warning_msg_title = "Go find your charger",
	warning_msg_text = "your battery is getting low.",
        warning_msg_position = "top_right",
	warning_msg_icon = "/home/arch-user/.config/awesome/widgets/batteryarc-widget/spaceman.jpg"
	}),

	space_3,


-- Logout Popup

	logout_popup.widget{},


        },
    }

-- ~~~~~~~~~~~~~~~~~~~
-- Create Bottom Wibox
-- ~~~~~~~~~~~~~~~~~~~

    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = dpi(32), bg = barcolor })
    s.borderwibox = awful.wibar({ position = "bottom", screen = s, height = dpi(1), bg = theme.fg_focus, x = dpi(0), y = dpi(33)})

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Add Widgets to Bottom Wibox
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
	

  -- ~~~~~~~~~~~~
  -- Left Widgets
  -- ~~~~~~~~~~~~
	{
	layout = wibox.layout.fixed.horizontal,

-- Launcher
	mylauncher,
	space_2,
        
-- CPU - lain

	space_25,

	cpu_widget({
	width = 29,
	step_width = 2,
	step_spacing = 0,
	--color = '#FFFFFF'      -- white
	--color = '#32FF00'      -- green
	color = '#ff0000'        --red
	}),

	space_10,
	space_25,

-- Spotify

        spotify_widget({
            font = 'Ubuntu Mono 9',
            play_icon = '/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg',
            pause_icon = '/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg',
            dim_when_paused = true,
            dim_opacity = 0.5,
            max_length = -1,
            show_tooltip = false
        }),


-- MPD

        theme.mpd.widget,



	},

  -- ~~~~~~~~~~~~~
  -- Middle Widget
  -- ~~~~~~~~~~~~~

	space_4,

  -- ~~~~~~~~~~~~~
  -- Right Widgets                                                       
  -- ~~~~~~~~~~~~~

	{ 

	layout = wibox.layout.fixed.horizontal,

-- Systray
--	wibox.widget.systray:set_screen ("1")
	custom_systray_red,
--	wibox.widget.systray(),
	space_3,

-- Textclock
	custom_textclock,
--	mytextclock,
	space_2,

	-- ~~~~~~~~~~~~~~~
	-- Unused Widgets
	-- ~~~~~~~~~~~~~~~

--bat, 			-- lain
--musicwidget,		-- awesompd
--net_wireless(),	-- awesome-wm-widgets
--net_wired(),		-- awesome-wm-widgets
--net_internet(),	-- awesome-wm-widgets
--theme.mail.widget,	-- lain
--theme.weather.icon,	-- lain
--theme.weather.widget, -- lain
--theme.fs.widget,      -- lain
--theme.volume.widget,  -- lain
--wibox.widget.systray(),
--widget_mic,           -- awesomewm.org



	  },
	 }
end
return theme
