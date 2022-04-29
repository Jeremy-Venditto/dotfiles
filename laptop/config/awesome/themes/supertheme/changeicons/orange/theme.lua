--[[

     Computerjerms Awesome WM theme
     github.com/computerjerms

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local net_wired = require("widgets.net_widgets.internet")
local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
net_wireless = require ("widgets.net_widgets.wireless")
local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/mytheme"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Terminus 10.5"


-- Theme Colors

theme.fg_normal                                 = "#D7D7D7"
theme.fg_focus                                  = "#ff0000"
theme.bg_normal                                 = "#060606"
theme.bg_focus                                  = "#060606"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#2A1F1E"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#0E0E0E"
theme.border_focus                              = "#F79372"

-- Awesome Wibar Icon

theme.awesome_icon                              = theme.dir .."/icons/awesome-red.png"

-- Taglist

--[[
	-- Awesome Taglist Letters (awesomewm-font)

--theme.taglist_font                            = "awesomewm-font 13"
--theme.taglist_fg_focus                                = "#39992af"
--theme.taglist_fg_occupied                     = "#164b6d"
--theme.taglist_fg_urgent                               = "#ED7572"
--theme.taglist_fg_empty                                = "#828282"
--theme.taglist_spacing                         = 2
--theme.taglist_bg_focus                          = "#060606"


--]]

	-- Regular Taglist

theme.taglist_font                              = "Icons 11"
theme.taglist_fg_focus                          = "#ff0000"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel-red.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel-white.png"
theme.taglist_fg_urgent                         = "#0000ff"
theme.taglist_spacing                           = 3


-- Tasklist

theme.tasklist_fg_focus                         = "#ffffff"
theme.tasklist_bg_focus                         = "#060606"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false

-- Menu 

theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"

-- Layout Icon Theme

theme.layout_tile                               = theme.dir .. "/icons/tile-red.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating-red.png"

-- Window Border Gaps

theme.useless_gap                               = 0

-- Titlebar Theme Settings

theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"


-- Widget Theme Settings

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
local widgetcolor       = "#ff0000"

-- Gray "#9E9C9A"

local connection = require("scripts.mpc")



-- Textclock
local mytextclock = wibox.widget.textclock(" %H:%M ")
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 11",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Mail IMAP check
--[[ to be set before use
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


--[[

-- Microphone Toggle
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




--[[
-- Network Wired
	net_wired = net_widgets.indicator({
    interfaces  = {"enp2s0", "another_interface", "and_another_one"},
    timeout     = 5

        widget:set_markup(markup.font(theme.font, markup(widgetcolor, artist) .. title .. " "))
    end


})

--]]

-- MPD
theme.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset.fg = white
        artist = mpd_now.artist .. " "
        title  = mpd_now.title  .. " "

        if mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = "n/"
            title  = "a"
        end

        widget:set_markup(markup.font(theme.font, markup(widgetcolor, artist) .. title .. " "))
--        widget:set_markup(markup(gmc.color['blue900'], artist)
--            .. markup(gmc.color['green900'], title)) 
   end
})

-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
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
--]]


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

-- ALSA volume
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


-- Weather
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

local volume_widget = require('widgets.volume-widget.volume')

    local logout_popup = require("widgets.logout-popup-widget.logout-popup")
local cpu_widget = require("widgets.cpu-widget.cpu-widget")
local brightness_widget = require("widgets.brightness-widget.brightness")
local batteryarc_widget = require("widgets.batteryarc-widget.batteryarc")
local net_widgets = require("widgets.net_widgets")
-- local pulse_widget = require("widgets.pulse-widget.pulse_widget")
net_wired = net_widgets.indicator({
    interfaces  = {"enp2s0", "another_interface", "and_another_one"},
    timeout     = 5
})

net_internet = net_widgets.internet({indent = 0, timeout = 5})

--mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
--                                     menu = mymainmenu })image = beautiful.awesome_icon,



-- Separators
local first     = wibox.widget.textbox('<span font="Terminus 4"> </span>')
local space_1 = wibox.widget.textbox(" ")
local space_2 = wibox.widget.textbox("  ")
local space_3 = wibox.widget.textbox("   ")
local space_4 = wibox.widget.textbox("    ")
local arrl_pre  = separators.arrow_right("alpha", "#1A1A1A")
local arrl_post = separators.arrow_right("#1A1A1A", "alpha")

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

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)



    -- Tags

		-- Standard

--    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

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


	    -- Add widgets to the wibox
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

arrl_pre,
arrl_post,
space_2,
        -- ~~~~~~~~~~
        --  Layouts
        -- ~~~~~~~~~~


s.mylayoutbox,
	
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
	--   MPD
	-- ~~~~~~~~
arrl_pre,
arrl_post,
space_4,

theme.mpd.widget,

arrl_pre,
arrl_post,
space_4,

	-- ~~~~~~~~~
	--  Systray
	-- ~~~~~~~~~

wibox.widget.systray(),

space_2,

        -- ~~~~~~~~
        --   CPU
        -- ~~~~~~~~

cpu_widget({
width = 20,
step_width = 2,
step_spacing = 0,
--color = '#FFFFFF'	 -- white
--color = '#32FF00' 	 -- green
color = '#ff0000' 	 --red
}),

space_3,

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
--warning_msg_position = bottom_right,
show_notification_mode = on_hover,
--warning_msg_title = "yo, go find your charger",
--position = "bottom_right",
size = 22
}),

space_3,

	-- ~~~~~~~~~
	-- Textclock
	-- ~~~~~~~~~

mytextclock,
space_2,


	-- ~~~~~~~~~
	--  Logout
	-- ~~~~~~~~~

logout_popup.widget{},
space_2,

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		-- ~~~~~~~~~~~~~~
		-- Unused Widgets
		-- ~~~~~~~~~~~~~~

--bat,
--brightness_widget(),
--cpu_widget(),
-- net_wireless,
--net_wireless(),
--net_wired(),
--net_internet(),
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

return theme
