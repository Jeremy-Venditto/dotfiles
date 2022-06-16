--[[
  _______
 |   _   |.--.--.--.-----.-----.-----.--------.-----.
 |       ||  |  |  |  -__|__ --|  _  |        |  -__|
 |___|___||________|_____|_____|_____|__|__|__|_____|
  ________ _______
 |  |  |  |   |   |     ▖     ▗             ▐▘▘
 |  |  |  |       |     ▌ ▀▌▛▌▜▘▛▌▛▌  ▛▘▛▌▛▌▜▘▌▛▌▛▌
 |________|__|_|__|     ▙▖█▌▙▌▐▖▙▌▙▌  ▙▖▙▌▌▌▐ ▌▌▌▙▌
                            ▌     ▌              ▄▌
                     
                    (_)__ ______ _  ___
                   / / -_) __/  ' \(_-<
                __/ /\__/_/ /_/_/_/___/
               |___/
                             ___ __  _
                     ___ ___/ (_) /_(_)__  ___
                    / -_) _  / / __/ / _ \/ _ \
                    \__/\_,_/_/\__/_/\___/_//_/

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        Please Read the README.md for full intructions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
]]--

local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

-- Standard awesome library
local gears         = require("gears") --Utilities such as color parsing and objects
local awful         = require("awful") --Everything related to window managment
                      require("awful.autofocus")
-- Widget and layout library
local wibox         = require("wibox")

-- Theme handling library
local beautiful     = require("beautiful")

-- Notification library
local naughty       = require("naughty")
naughty.config.defaults['icon_size'] = 200

-- local lain          = require("widgets.lain")
local lain	    = require("lain")
local freedesktop   = require("widgets.freedesktop")
local menubar = require("menubar")
local logout_popup = require("widgets.logout-popup-widget.logout-popup")
local xrandr = require("scripts.xrandr")
local volume_widget = require('widgets.volume-widget.volume')
local brightness_widget = require("widgets.brightness-widget.brightness")
local spotify_shell = require("widgets.spotify-shell.spotify-shell")
local awesompd = require("widgets/awesompd/awesompd")
-- local mpd-popup = require("scripts.mpd-popup")
local autofocus_previous =("scripts.autfocus.autofocus-previous")

--new
--local revelation=require("widgets/revelation")

		-- -- Hotkey Popup Menu --

-- Remove tmux commands from hotkeys popup
package.loaded["awful.hotkeys_popup.keys.tmux"] = {}

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:

local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")

--local hotkeys_popup = require("awful.hotkeys_popup").widget.new({width = 1400, height = 1000 })
--local hotkeys_popup = require("awful.hotkeys_popup").widget.new()
--     		      require("awful.hotkeys_popup.keys")


local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

		--
		-- Notifications
		--

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "yeah, whatever you just did ruined it..",
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
                         title = "Aw jeez, pal.. What did you do?",
                         text = tostring(err) })
        in_error = false
    end)
end

--[[
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "unclutter -root" }) -- entries must be comma-separated
--]]

local themes = {
    
"blackburn",	    -- 1
"copland",          -- 2
"dremora",	    -- 3
"computerjerms",    -- 4
"holo",		    -- 5
"powerarrow",       -- 6
"powerarrow_blue",  -- 7
"powerarrow_dark",  -- 8
"rainbow",	    -- 9
"supertheme",	    -- 10 
"vertex",	    -- 11
"fallback",	    -- 12
"jerms-red",	    -- 13
--"multicolor",	    -- 14
--"steamburn"	    -- 15
}

-- choose your theme here
local chosen_theme = themes[13]
beautiful.init(string.format(gears.filesystem.get_configuration_dir() .. "/themes/%s/theme.lua", chosen_theme))

-- Run garbage collector regularly to prevent memory leaks
gears.timer {
       timeout = 30,
       autostart = true,
       callback = function() collectgarbage() end
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 	Default Terminal, Editor, Browser, Mailclient, VM
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Modkeys for keybindings

	local modkey       = "Mod4"
	local altkey       = "Mod1"
	local modkey1      = "Control"

local terminal = "terminator"

editor = os.getenv("EDITOR") or "nano"

editor_cmd = terminal .. " -e " .. editor

local browser = "firefox"

local mailclient = "thunderbird"

local mediaplayer = "vlc"

local virtualmachine = "virtualbox"

local editorgui         = "kate"

local filemanager       = "thunar"

local scrlocker         = "slimlock"

awful.util.terminal = terminal

-- ~~~~~~~
-- Layouts
-- ~~~~~~~

-- awful.layout.suit.tile.left.mirror = true

awful.layout.layouts = {

    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.fair,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}


-- Need to get icons for termfairr and lain layout

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = 2
lain.layout.cascade.tile.offset_y      = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2


-- ~~~~~~~
-- Taglist  original
-- ~~~~~~~

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- ~~~~~~~
-- Taglist  numpad
-- ~~~~~~~
--[[
-- Numpad: [0-9] = [#30-#39]
local np_map = { 30, 31, 32, 33, 34, 35, 36, 37, 38, 39 }
for i = 1, keynumber do
   globalkeys = awful.util.table.join(
      globalkeys,
      awful.key({ modkey }, "#" .. np_map[i],
        function ()
           local screen = mouse.screen
           if tags[screen][i] then
              awful.tag.viewonly(tags[screen][i])
           end
        end),
      awful.key({ modkey, "Control" }, "#" .. np_map[i],
        function ()
           local screen = mouse.screen
           if tags[screen][i] then
              awful.tag.viewtoggle(tags[screen][i])
           end
        end),
      awful.key({ modkey, "Shift" }, "#" .. np_map[i],
        function ()
           if client.focus and tags[client.focus.screen][i] then
              awful.client.movetotag(tags[client.focus.screen][i])
           end
        end),
      awful.key({ modkey, "Control", "Shift" }, "#" .. np_map[i],
        function ()
           if client.focus and tags[client.focus.screen][i] then
              awful.client.toggletag(tags[client.focus.screen][i])
           end
        end))
end
--]]

-- ~~~~~~~~
-- Tasklist
-- ~~~~~~~~

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", {raise = true})
        end
    end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = 250}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)


                        -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                        --      Initialize theme
                        -- everything after this point
                        -- is controlled by the theme
                        -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- beautiful.init(string.format(gears.filesystem.get_configuration_dir() .. "/themes/%s/theme.lua", chosen_theme))




--[[

    dMMMMMMMMb  dMMMMMP dMMMMb  dMP dMP 
   dMP"dMP"dMP dMP     dMP dMP dMP dMP  
  dMP dMP dMP dMMMP   dMP dMP dMP dMP   
 dMP dMP dMP dMP     dMP dMP dMP.aMP    
dMP dMP dMP dMMMMMP dMP dMP  VMMMP"     


This Configuration is set to use the freedesktop build menu.

Switch to Custom Menu:

   In this menu section:

1) comment out "FreeDekstop Menu with Icons" / uncomment "Custom Menu"

   In keybindings section:

2) comment out "FreeDekstop Menu Keybinding" / uncomment "Custom Menu Keybinding"

--]]

		-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		--  FreeDesktop Menu with Icons
		-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--[[
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", terminal .. " -e 'man awesome'" },
    { "edit config", terminal.." nano /home/arch-user/.config/awesome/rc.lua" },
    { "reload", awesome.restart },
        { "Log out", function() awesome.quit() end },
        { "Sleep", "systemctl suspend" },
        { "Restart", "systemctl reboot" },
        { "Shutdown", "systemctl poweroff" },

}


awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or 16,
    before = {

        { "Awesome", myawesomemenu, beautiful.awesome_icon },
	{ "Programs", myprogrammenu },
    },
    after = {
        { "Terminal", terminal },
        { "Dmenu", 'dmenu_run -l 20 -nb black -nf green -sb blue -sf black' },
        { "Xkill", 'xkill' },

    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = awful.util.mymainmenu })

--]]
		-- ~~~~~~~~~~~~~~
		--  Custom Menu
		-- ~~~~~~~~~~~~~~

local myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "edit config", editor_cmd .. "/home/arch-user/.config/awesome/rc.lua" },
   { "manual", terminal .. " -e man awesome" },
   { "reload", awesome.restart },
   { "Log out", function() awesome.quit() end },
   { "Sleep", "systemctl suspend" },
   { "Restart", "systemctl reboot" },
   { "Shutdown", "systemctl poweroff" },

}

mybrowsermenu = {
   { "Brave", function () awful.util.spawn_with_shell("brave") end, '/home/arch-user/.config/awesome/icons/menu/brave.svg' },
   { "Chromium", function () awful.util.spawn_with_shell("chromium") end, '/home/arch-user/.config/awesome/icons/menu/chromium.svg' },
   { "Firefox", function () awful.util.spawn_with_shell("firefox") end, '/home/arch-user/.config/awesome/icons/menu/firefox_alt.png' },
   { "Librewolf", function () awful.util.spawn_with_shell("librewolf") end, '/home/arch-user/.config/awesome/icons/menu/librewolf.svg' },
   { "Surf", function () awful.util.spawn_with_shell("surf") end, },
}

mymusicmenu = {
   { "Deadbeef", function () awful.util.spawn_with_shell("deadbeef") end, '/home/arch-user/.config/awesome/icons/menu/deadbeef.png' },
   { "MPD", function () awful.util.spawn_with_shell("terminator -e ncmpcp") end, '/home/arch-user/.config/awesome/icons/menu/mpd.png' },
   { "Rhythmbox", function () awful.util.spawn_with_shell("rhythmbox") end, '/home/arch-user/.config/awesome/icons/menu/rhythmbox.png' },
   { "Spotify", function () awful.util.spawn_with_shell("spotify") end, '/home/arch-user/.config/awesome/icons/menu/spotify.png' },
   { "~~~~~~", },
   { "Music Folder", function () awful.util.spawn_with_shell("xdg-open ~/music") end, '/home/arch-user/.config/awesome/icons/menu/music-dir.jpg' },
}

mymailmenu = {
   { "Gmail", function () awful.util.spawn_with_shell("chromium gmail.com") end, '/home/arch-user/.config/awesome/icons/menu/gmail.png' },
   { "Outlook", function () awful.util.spawn_with_shell("chromium outlook.com") end, '/home/arch-user/.config/awesome/icons/menu/outlook.png' },
   { "Thunderbird", function () awful.util.spawn_with_shell("thunderbird") end, '/home/arch-user/.config/awesome/icons/menu/thunderbird.png' },
}

mydesignmenu = {
   { "Ascii Design", 'ascii-design', '/home/arch-user/.config/awesome/icons/menu/ascii-design.jpg' },
   { "Audactiy", function () awful.util.spawn_with_shell("audacity") end, '/home/arch-user/.config/awesome/icons/menu/audacity.png' },
   { "Blender", function () awful.util.spawn_with_shell("blender") end, '/home/arch-user/.config/awesome/icons/menu/blender.png' },
   { "Gimp", function () awful.util.spawn_with_shell("gimp") end, '/home/arch-user/.config/awesome/icons/menu/gimp.svg' },
   { "Handbrake", function () awful.util.spawn_with_shell("handbrake") end, '/home/arch-user/.config/awesome/icons/menu/handbrake.png' },
   { "Kdenlive", function () awful.util.spawn_with_shell("kdenlive") end, '/home/arch-user/.config/awesome/icons/menu/kdenlive.png' },
   { "LMMS", function () awful.util.spawn_with_shell("lmms") end, '/home/arch-user/.config/awesome/icons/menu/lmms-alt.png' },
}

myofficemenu = {

   { "Kate", function () awful.util.spawn_with_shell("kate") end, '/home/arch-user/.config/awesome/icons/menu/kwrite.svg' },
   { "~~~~~~", },
   { "Libreoffice", function () awful.util.spawn_with_shell("libreoffice") end, '/home/arch-user/.config/awesome/icons/menu/office.png' },
   { "-- Writer", function () awful.util.spawn_with_shell("lowriter") end, '/home/arch-user/.config/awesome/icons/menu/office-writer.png' },
   { "-- Calc", function () awful.util.spawn_with_shell("localc") end, '/home/arch-user/.config/awesome/icons/menu/office-calc.png' },
   { "-- Draw", function () awful.util.spawn_with_shell("lodraw") end, '/home/arch-user/.config/awesome/icons/menu/office-draw.png' },
   { "-- Impress", function () awful.util.spawn_with_shell("loimpress") end, '/home/arch-user/.config/awesome/icons/menu/office-impress.png' },
   { "-- Math", function () awful.util.spawn_with_shell("lomath") end, '/home/arch-user/.config/awesome/icons/menu/office-math.png' },
   { "-- Web", function () awful.util.spawn_with_shell("loweb") end, '/home/arch-user/.config/awesome/icons/menu/office-web.png' },
   { "~~~~~~", },
   { "Thunar", function () awful.util.spawn_with_shell("thunar") end, '/home/arch-user/.config/awesome/icons/menu/thunar.png' },
   { "Dolphin", function () awful.util.spawn_with_shell("thunar") end, '/home/arch-user/.config/awesome/icons/menu/thunar.png' },
   { "Ranger", function () awful.util.spawn_with_shell("thunar") end, '/home/arch-user/.config/awesome/icons/menu/thunar.png' },
   { "nnn", function () awful.util.spawn_with_shell("thunar") end, '/home/arch-user/.config/awesome/icons/menu/thunar.png' },
   { "~~~~~~", },
   { "Documents", function () awful.util.spawn_with_shell("xdg-open ~/documents") end, '/home/arch-user/.config/awesome/icons/menu/music-dir.jpg' },
   { "Downloads", function () awful.util.spawn_with_shell("xdg-open ~/downloads") end, '/home/arch-user/.config/awesome/icons/menu/music-dir.jpg' },
}

mycodingmenu = {
   { "Notepad QQ", function () awful.util.spawn_with_shell("virtualbox") end, '/home/arch-user/.config/awesome/icons/menu/virtualbox.png' },
   { "~~~~~~", },
   { "Python", function () awful.util.spawn_with_shell("vlc") end, '/home/arch-user/.config/awesome/icons/menu/vlc.png' },
   { "Lua", function () awful.util.spawn_with_shell("vlc") end, '/home/arch-user/.config/awesome/icons/menu/vlc.png' },
   { "Bash", function () awful.util.spawn_with_shell("vlc") end, '/home/arch-user/.config/awesome/icons/menu/vlc.png' },
   { "ZSH", function () awful.util.spawn_with_shell("vlc") end, '/home/arch-user/.config/awesome/icons/menu/vlc.png' },
   { "Fish", function () awful.util.spawn_with_shell("vlc") end, '/home/arch-user/.config/awesome/icons/menu/vlc.png' },
   { "~~~~~~", },
   { "Directory", function () awful.util.spawn_with_shell("xdg-open ~/programming") end, '/home/arch-user/.config/awesome/icons/menu/music-dir.jpg' },
}


myprogrammenu = {
   { "Balena Etcher", function () awful.util.spawn_with_shell("balenaetcher") end, '/home/arch-user/.config/awesome/icons/menu/balena-etcher.png' },
   { "KeepassXC", function () awful.util.spawn_with_shell("keepassxc") end, '/home/arch-user/.config/awesome/icons/menu/keepass.png' },
   { "Nextcloud", function () awful.util.spawn_with_shell("nextcloud") end, '/home/arch-user/.config/awesome/icons/menu/nextcloud.png' },    
   { "Shotwell", function () awful.util.spawn_with_shell("shotwell") end, '/home/arch-user/.config/awesome/icons/menu/shotwell.png' },
   { "Timeshift", function () awful.util.spawn_with_shell("timeshift") end, '/home/arch-user/.config/awesome/icons/menu/timeshift.png' },
   { "Veracrypt", function () awful.util.spawn_with_shell("veracrypt") end, '/home/arch-user/.config/awesome/icons/menu/veracrypt.png' },
   { "Virtualbox", function () awful.util.spawn_with_shell("virtualbox") end, '/home/arch-user/.config/awesome/icons/menu/virtualbox.png' },
   { "VLC", function () awful.util.spawn_with_shell("vlc") end, '/home/arch-user/.config/awesome/icons/menu/vlc.png' },
   { "VLC", mycodingmenu, '/home/arch-user/.config/awesome/icons/menu/vlc.png' },

}

mysettingsmenu = {
   { "Alsa Mixer", function () awful.util.spawn_with_shell("terminator -e alsamixer") end, '/home/arch-user/.config/awesome/icons/menu/alsamixer.png' },
   { "Grub Settings", function () awful.util.spawn_with_shell("grub-customizer") end, '/home/arch-user/.config/awesome/icons/menu/grub-customizer.svg' },
   { "Pulse Audio", function () awful.util.spawn_with_shell("terminator -e pavucontrol") end, '/home/arch-user/.config/awesome/icons/menu/pulse.png' },
   { "XFCE Settings", function () awful.util.spawn_with_shell("xfce4-settings-manager") end, '/home/arch-user/.config/awesome/icons/menu/xfce.png' },
   { "KDE Settings", function () awful.util.spawn_with_shell("systemsettings5") end, '/home/arch-user/.config/awesome/icons/menu/kde-settings.svg' },
   { "Printer", function () awful.util.spawn_with_shell("system-config-printer") end, '/home/arch-user/.config/awesome/icons/menu/printer.svg' },
   { "QT Settings", function () awful.util.spawn_with_shell("qt5ct") end, '/home/arch-user/.config/awesome/icons/menu/qt.png' },
}
awful.util.mymainmenu = awful.menu({ items = { 
				    { "Awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "~~~~~~", },
                                    { "Dmenu", 'dmenu_run -l 20 -nb black -nf white -sb red -sf white' },
                                    { "Rofi", 'rofi -show run' },
                                    { "~~~~~~", },
                                    { "Browsers", mybrowsermenu, '/home/arch-user/.config/awesome/icons/menu/webbrowser.jpg' },
				    { "Music", mymusicmenu, '/home/arch-user/.config/awesome/icons/menu/music.png' },
                                    { "Programs", myprogrammenu, '/home/arch-user/.config/awesome/icons/menu/tux.png' },
				    { "Design", mydesignmenu, '/home/arch-user/.config/awesome/icons/menu/design.png' },
				    { "Mail", mymailmenu, '/home/arch-user/.config/awesome/icons/menu/mail.png' },
				    { "Coding", mycodingmenu, '/home/arch-user/.config/awesome/icons/menu/coding.png' },
				    { "Office", myofficemenu, '/home/arch-user/.config/awesome/icons/menu/office.png' },
                                    { "Settings", mysettingsmenu, '/home/arch-user/.config/awesome/icons/menu/settings.png' },
                                    { "~~~~~~", },
                                    { "File Manager", 'xdg-open /home/arch-user/documents', '/home/arch-user/.config/awesome/icons/menu/file-manager.png' },
				    { "Search Files", 'fsearch', '/home/arch-user/.config/awesome/icons/menu/file-manager.png' },
                                    { "Calculator", 'gnome-calculator', '/home/arch-user/.config/awesome/icons/calculator.svg' },
                                    { "Terminal", terminal, '/home/arch-user/.config/awesome/icons/menu/terminal.png' },
                                    { "~~~~~~", },
			  	    { "Xkill", 'xkill' }
                                  }
                        })


mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = awful.util.mymainmenu })


menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it


-- ~~~~~~~~~
-- Wallpaper  -- Keep this or awesome breaks
-- ~~~~~~~~~  -- Nitrogen and cron overrides this... maybe make this work sometime?

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)




-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- OVERRIDE THEME.LUA ICONS AND GAP SETTINGS

-- Use correct status icon size
--awesome.set_preferred_icon_size(32)

-- Enable gaps
-- beautiful.useless_gap = 4
--  beautiful.gap_single_client = true

-- Fix window snapping
 awful.mouse.snap.edge_enabled = false

-- END OVERRIDE
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

--[[
		-- doesn't break but not sure if it works correctly...

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width -- your border width
        end
    end
end)
--]]

-- Create a wibox for each screen and add it
-- if errors occur here.. the error is in theme.lua
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~ Mouse ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Mouse default scrollwheel tag switch

root.buttons(my_table.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Mouse no scroll wheel tag switch.. breaks click to raise at the moment

--[[
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)))
--]]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--[[

 _              _    _         _  _               
| |__ ___  _ _ | |_ <_>._ _  _| |<_>._ _  ___  ___
| / // ._>| | || . \| || ' |/ . || || ' |/ . |<_-<
|_\_\\___.`_. ||___/|_||_|_|\___||_||_|_|\_. |/__/
          <___'                          <___'    


  ▜   ▌   ▜ 
▛▌▐ ▛▌▛▌▀▌▐ 
▙▌▐▖▙▌▙▌█▌▐▖
▄▌          

--]]

globalkeys = my_table.join(


--
-- AUDIO
--

-- Spofify
	
	-- Play / Pause

    awful.key({ modkey,  }, "XF86AudioPlay",
        function ()
            os.execute("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
        end,
        {description = "Spotify - Play/Pause", group = "Music-Spotify"}),

	-- Next


    awful.key({ modkey,  }, "XF86AudioNext",
        function ()
            os.execute("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
        end,
        {description = "Spotify - Next Song", group = "Music-Spotify"}),

	-- Previous

    awful.key({ modkey,  }, "XF86AudioPrev",
        function ()
            os.execute("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
        end,
        {description = "Spotify - Previous Song", group = "Music-Spotify"}),
	
	-- Stop

    awful.key({ modkey,  }, "XF86AudioStop",
        function ()
            os.execute("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop")
        end,
        {description = "Spotify - Stop", group = "Music-Spotify"}),

	-- Spotify Shell

    awful.key({ modkey,        }, "d", function () spotify_shell.launch() end, {description = "spotify shell", group = "Music"}),

-- Master Volume Up (alsa)

--widget
	awful.key({ modkey, }, "]", function() volume_widget:inc() end,
	{description = "Volume - Up", group = "Audio-Master"}),

        awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            os.execute("amixer -q sset Master 5%+")
        end,
        {description = "Up", group = "Audio-Master"}),


        awful.key({modkey, }, "F4", function ()
            os.execute("amixer -q sset Master 5%+")
        end,
        {description = "Up", group = "Audio-Master"}),

-- Master Volume Down (alsa)

  -- widget

	awful.key({ modkey, }, "[", function() volume_widget:dec() end,
	{description = "Volume - Down", group = "Audio-Master"}),

  -- alsa

    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            os.execute("amixer -q sset Master 5%-")
        end,
        {description = "Down", group = "Audio-Master"}),


    awful.key({modkey, }, "F3",
        function ()
            os.execute("amixer -q sset Master 5%-")
        end,
        {description = "Down", group = "Audio-Master"}),

-- Volume Mute

  -- widget

	awful.key({ modkey, }, "\\", function() volume_widget:toggle() end,
	{description = "Volume - Mute", group = "Audio-Master"}),

  -- alsa

       awful.key({ }, "XF86AudioMute",
        function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
	end,
        {description = "Mute", group = "Audio-Master"}),

       awful.key({ modkey, }, "F5",
        function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "Mute", group = "Audio-Master"}),


-- Toggle microphone state
--[[
	-- Pulse Audio

        awful.key({ altkey, }, "m",
	function ()
   	 awful.spawn(string.format("pactl set-source-mute 1 toggle",
         beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {description = "Toggle Microphone", group = "Audio-Master"}),
--]]
	-- Alsa
--[[
        awful.key({ altkey, }, "m",
        function ()
         awful.spawn(string.format("amixer set Capture nocap",
         beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {description = "Toggle Microphone", group = "Audio-Master"}),

        awful.key({ altkey, "Shift"}, "m",
        function ()
         awful.spawn(string.format("amixer set Capture cap",
         beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {description = "Toggle Microphone", group = "Audio-Master"}),
--]]
        awful.key({ altkey, }, "m",
        function ()
         awful.spawn(string.format("amixer set Capture toggle",
         beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {description = "Toggle Microphone", group = "Audio-Master"}),

-- Pulse Toggle Sinks
	-- Speakers
    awful.key({ altkey, }, "1",
        function () awful.util.spawn_with_shell("~/.config/awesome/scripts/pulse/pulse-move-sinks.sh 3") end,
                {description = "Switch to Speakers", group = "Audio"}),
	-- Headphones
    awful.key({ altkey, }, "2",
        function () awful.util.spawn_with_shell("~/.config/awesome/scripts/pulse/pulse-move-sinks.sh 2") end,
                {description = "Switch to Headphones", group = "Audio"}),

-- Audio Controls via mpc

   awful.key({ }, "XF86AudioPlay",
--        function() os.execute("mpc toggle")        end,
       function()  awful.spawn.with_shell(string.format("mpc toggle && mpDris2 &"))  end,
        {description = "MPC Play/Pause", group = "Music-MPD"}),

   awful.key({ }, "XF86AudioNext",
--        function() os.execute("mpc next")        end,
       function()  awful.spawn.with_shell(string.format("mpc next"))  end,
        {description = "MPC Next", group = "Music-MPD"}),

-- Go forward 15 seconds MPD
   awful.key({modkey, }, "XF86AudioNext",
       function()  awful.spawn.with_shell(string.format("mpc seek +00:00:15"))  end,
        {description = "MPC +15 sec", group = "Music-MPD"}),

   awful.key({ }, "XF86AudioPrev",
--        function()  os.execute("mpc previous")        end,
       function()  awful.spawn.with_shell(string.format("mpc prev"))  end,
        {description = "MPC Previous", group = "Music-MPD"}),

-- Go back 15 seconds MPD
   awful.key({modkey }, "XF86AudioPrev",
       function()  awful.spawn.with_shell(string.format("mpc seek -00:00:15"))  end,
        {description = "MPC -15 sec", group = "Music-MPD"}),

   awful.key({ }, "XF86AudioStop",
--   awful.key({ }, "F7",
        function()  os.execute("mpc stop")        end,
        {description = "MPC Stop", group = "Music-MPD"}),



-- Music Widget MPD awesompd

    awful.key({ modkey, }, "F7",
        musicwidget:command_show_menu(),
                {description = "mpd show menu", group = "Music-MPD"}),
--[[
    awful.key({ modkey, "Control" }, "XF86AudioPlay",
        musicwidget:command_playpause(),
                {description = "mpd play/pause", group = "Music-MPD"}),
--]]
    awful.key({modkey,  }, "XF86AudioRaiseVolume",
	musicwidget:command_volume_up(),
                {description = "mpd volume up", group = "Music-MPD"}),

    awful.key({modkey, }, "XF86AudioLowerVolume",
	musicwidget:command_volume_down(),
                {description = "mpd volume down", group = "Music-MPD"}),
--[[
    awful.key({ modkey, "Control" }, "XF86AudioPrev",
	musicwidget:command_prev_track(),
                {description = "mpd previous track", group = "Music-MPD"}),

    awful.key({ modkey, "Control" }, "XF86AudioNext",
	musicwidget:command_next_track(),
                {description = "mpd next track", group = "Music-MPD"}),
--]]


-- Redshift
    awful.key({ altkey, }, "0",
        function () awful.util.spawn_with_shell("pkill redshift && redshift-gtk -b 1.0") end,
                {description = "Redshift 100", group = "Brightness"}),
    awful.key({ altkey, }, "9",
        function () awful.util.spawn_with_shell("pkill && redshift-gtk -b 0.6") end,
                {description = "Redshift 0.6", group = "Brightness"}),
    awful.key({ altkey, }, "8",
        function () awful.util.spawn_with_shell("pkill redshift && redshift-gtk -b 0.8") end,
                {description = "Redshift 0.8", group = "Brightness"}),
    awful.key({ altkey, }, "7",
        function () awful.util.spawn_with_shell("redshift-gtk -O 6500") end,
                {description = "Redshift Kill", group = "Brightness"}),
    awful.key({ altkey, }, "6",
        function () awful.util.spawn_with_shell("&& redshift-gtk -O 5000") end,
                {description = "Redshift Kill", group = "Brightness"}),
    awful.key({ altkey, }, "5",
        function () awful.util.spawn_with_shell("redshift -x && redshift-gtk") end,
                {description = "Redshift Reset", group = "Brightness"}),

                --
                -- BROWSERS
                --

-- Brave

    awful.key({ altkey, "Control"}, "b",
	function () awful.util.spawn_with_shell("brave") end,
		{description = "Brave", group = "Programs-Browsers"}),

-- Chromium

    awful.key({ altkey, "Control"}, "c",
        function () awful.util.spawn_with_shell("chromium") end,
                {description = "Chromium", group = "Programs-Browsers"}),

-- Firefox

    awful.key({ altkey, "Control"}, "f",
        function () awful.util.spawn_with_shell("firefox") end,
--        function (c)
--            c.maximized = not c.maximized
--            c:raise()
---        end,
                {description = "Firefox", group = "Programs-Browsers"}),

-- Librewolf

    awful.key({ altkey, "Control"}, "l",
	function () awful.util.spawn_with_shell("librewolf") end,
		{description = "Librewolf", group = "Programs-Browsers"}),


                --
                -- BRIGHTNESS
                --

-- Brightness up

	-- Widget

    awful.key({ modkey,          }, ";",
	function () brightness_widget:inc() end,
		{description = "increase brightness", group = "Brightness"}),

--[[
	-- Xbacklight

    awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
              {description = "+10%", group = "Brightness"}),
--]]

--[[
	-- Light
    awful.key({ modkey,          }, ";",
	function () os.execute("light -A 5") end,
              {description = "increase brightness", group = "Brightness"}),

--]]
    awful.key({ }, "XF86MonBrightnessUp",
	function () os.execute("light -A 5") end,
              {description = "increase brightness", group = "Brightness"}),


-- Brightness down

	-- Widget

    awful.key({ modkey, "Shift"  }, ";",
	function () brightness_widget:dec() end,
	      {description = "decrease brightness", group = "Brightness"}),

--[[
	-- Xbacklight

    awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 5") end,
              {description = "", group = "Brightness"}),
--]]

--[[
	-- Light
    awful.key({ modkey, "Shift"  }, ";",
	function () os.execute("light -U 5") end,
              {description = "Down", group = "Brightness"}),
--]]
    awful.key({ }, "XF86MonBrightnessDown",
 function () os.execute("light -U 5") end,
              {description = "decrease brightness", group = "Brightness"}),


                --
                -- Gaps
                --


-- Increase Border Gaps

    awful.key({ modkey, altkey }, "Up",
        function () lain.util.useless_gaps_resize(1) end,
              {description = "increase border gaps", group = "Gaps"}),
--[[
    awful.key({ modkey, altkey }, "Right",
	function () lain.util.useless_gaps_resize(1) end,
              {description = "increase border gaps", group = "Gaps"}),
--]]

-- Decrease Border Gaps

    awful.key({ modkey, altkey }, "Down",
        function () lain.util.useless_gaps_resize(-1) end,
              {description = "decrease border gaps", group = "Gaps"}),
--[[
    awful.key({ modkey, altkey }, "Left",
	function () lain.util.useless_gaps_resize(-1) end,
              {description = "decrease border gaps", group = "Gaps"}),
--]]

                --
                -- Launcher
                --

-- dmenu

	awful.key({ modkey, "Control" }, "Return",
    		function ()
--         awful.spawn(string.format("dmenu_run -l 20 -nb black -nf green -sb blue -sf black",
	 awful.spawn(string.format("dmenu_run -l 20 -nb black -nf white -sb red -sf white",
	 beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)) end,
	      {description = "dmenu", group = "Launcher"}), 

-- rofi 
	        awful.key({"Control",  }, "Return",
                function ()
         awful.spawn(string.format("rofi -show run",
         beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)) end,
              {description = "rofi", group = "Launcher"}),
-- Menubar

    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "Launcher"}),

-- Menu Popup

   awful.key({ modkey,           }, "w",
	function () awful.util.mymainmenu:show() end,
            {description = "show main menu", group = "System"}),

-- Prompt

    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "Launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "Launcher"}),

                --
                -- Music
                --

-- fsearch
    awful.key({ altkey, }, "Tab",
        function () awful.util.spawn_with_shell("fsearch") end,
                {description = "fsearch", group = "System"}),

-- Deadbeef

    awful.key({ altkey, "Control"}, "d",
        function () awful.util.spawn_with_shell("deadbeef") end,
                {description = "Deadbeef", group = "Music"}),

-- ncmpcpp

    awful.key({ altkey, "Control"}, "m",
        function () awful.util.spawn_with_shell("terminator -e ncmpcpp") end,
                {description = "ncmpcpp", group = "Music"}),

-- Rhythmbox

    awful.key({ altkey, "Control"}, "r",
        function () awful.util.spawn_with_shell("rhythmbox") end,
                {description = "VLC", group = "Music"}),

-- Spotify

    awful.key({ altkey, "Control"}, "s",
        function () awful.util.spawn_with_shell("spotify") end,
                {description = "Spotify", group = "Music"}),


            --
            -- PRINTER
            --


    awful.key({ altkey, "Control"}, "3",
        function () awful.util.spawn_with_shell("libreoffice") end,
                {description = "Libreoffice", group = "Programs-Office"}),

    awful.key({ altkey,   }, "`",
--    awful.key({ altkey,   }, "#79",
        function () awful.util.spawn_with_shell("gnome-calculator") end,
                {description = "Calculator", group = "Programs-Office"}),

    awful.key({ altkey, "Control"}, "p",
        function () awful.util.spawn_with_shell("system-config-printer") end,
                {description = "Printer", group = "Programs-Office"}),


            --
            -- PROGRAMS
            --


-- Audacity

    awful.key({ altkey, "Control"}, "a",
        function () awful.util.spawn_with_shell("audacity") end,
                {description = "Audacity", group = "Programs"}),

-- Basket Notes

    awful.key({ modkey, altkey }, "n",
        function () awful.util.spawn_with_shell("basket") end,
                {description = "Basket Notes", group = "Programs-Productivity"}),

-- Dolphin

    awful.key({ altkey, "Control"}, "d",
	function () awful.util.spawn_with_shell("dolphin") end,
		{description = "Dolphin", group = "Programs"}),

-- Geary

    awful.key({ altkey, "Control"}, "8",
        function () awful.util.spawn_with_shell("geary") end,
                {description = "geary", group = "Programs"}),

-- Gimp

    awful.key({ altkey, "Control"}, "g",
        function () awful.util.spawn_with_shell("gimp") end,
                {description = "GIMP", group = "Programs"}),

-- Guvcview Webcam

    awful.key({ altkey, "Control"}, "w",
        function () awful.util.spawn_with_shell("guvcview") end,
                {description = "Guvcview Webcam", group = "Programs"}),

-- Kate

    awful.key({ altkey, "Control"}, "e",
	function () awful.util.spawn_with_shell("kate") end,
		{description = "kate", group = "Programs"}),

-- Kdenlive

    awful.key({ altkey, "Control"}, "1",
        function () awful.util.spawn_with_shell("kdenlive") end,
                {description = "Kdenlive", group = "Programs"}),

-- KeepassXC

    awful.key({ altkey, "Control"}, "k",
	function () awful.util.spawn_with_shell("keepassxc") end,
 		{description = "Keepass XC", group = "Programs"}),

-- LMMS

    awful.key({ altkey, "Control"}, "3",
        function () awful.util.spawn_with_shell("lmms") end,
                {description = "LMMS", group = "Programs"}),

-- MPV

    awful.key({ altkey, "Control"}, "9",
        function () awful.util.spawn_with_shell("mpv") end,
                {description = "MPV", group = "Programs"}),

-- OBS

    awful.key({ altkey, "Control"}, "o",
        function () awful.util.spawn_with_shell("obs-studio") end,
                {description = "OBS Studio", group = "Programs"}),

-- Screenshots

	-- Shotgun

    awful.key({ modkey, "Shift" }, "Print",
        function () awful.util.spawn_with_shell("shotgun") end,
                {description = "Shotgun Screenshot", group = "Programs-Screenshots"}),

--[[
	-- XFCE Screenshot

    awful.key({ modkey, altkey }, "Print",
        function () awful.util.spawn_with_shell("xfce4-screenshooter") end,
                {description = "XFCE Screenshot", group = "Programs-Screenshots"}),
--]]

	-- Gnome Screenshot

    awful.key({ modkey, "Control" }, "Print",
        function () awful.util.spawn_with_shell("gnome-screenshot -i") end,
                {description = "Gnome Screenshot", group = "Programs-Screenshots"}),

        -- KDE Screenshot

    awful.key({ modkey, }, "Print",
        function () awful.util.spawn_with_shell("spectacle") end,
                {description = "KDE Screenshot", group = "Programs-Screenshots"}),

-- Simple Screen Recorder

    awful.key({ altkey, "Control"}, "2",
        function () awful.util.spawn_with_shell("simplescreenrecorder") end,
                {description = "Simple Screen Recorder", group = "Programs"}),

-- Thunar

    awful.key({ altkey, "Control"}, "t",
        function () awful.util.spawn_with_shell("thunar") end,
                {description = "Thunar", group = "Programs"}),

-- Veracrypt

    awful.key({ altkey, "Control"}, ".",
	function () awful.util.spawn_with_shell("veracrypt") end,
 		{description = "Veracrypt", group = "Programs"}),

-- Virtualbox

    awful.key({ altkey, "Control"}, "v",
	function () awful.util.spawn_with_shell("virtualbox") end,
 		{description = "Virtualbox", group = "Programs"}),

-- VLC

    awful.key({ altkey, "Control"}, "4",
        function () awful.util.spawn_with_shell("vlc") end,
                {description = "VLC", group = "Programs"}),

-- Vym Mind Mapping Program

    awful.key({ modkey, altkey }, "3",
        function () awful.util.spawn_with_shell("vym") end,
                {description = "Vym Mind Mapping", group = "Programs-Productivity"}),

        --
        --  SYSTEM
        --

-- Open Terminal

    awful.key({ modkey,           }, "Return",
	function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "Launcher"}),

-- Restart Awesome

    awful.key({ modkey, "Control" }, "r",
	awesome.restart,
              {description = "reload awesome", group = "System"}),

--[[
-- Quit Awesome

    awful.key({ modkey, "Shift"   }, "q",
	awesome.quit,
              {description = "quit awesome", group = "System"}),
--]]

-- Change Wallpaper

-- LAPTOP

--    awful.key({ modkey, "Shift" }, "w",
--	function () awful.util.spawn_with_shell("nitrogen --set-zoom-fill --random $HOME/files/stuff/images/wallpaper/1920x1080") end,
--	      {description = "Change Wallpaper", group = "System"}),

-- DESKTOP

    awful.key({ modkey, "Shift" }, "w",
        function () awful.util.spawn_with_shell("~/.local/bin/nitrogen-change-all.sh") end,
              {description = "Change Wallpaper", group = "System"}),

-- Clipboard

  -- Copy primary to clipboard (terminals to gtk)

    awful.key({ modkey }, "c", function ()
	awful.spawn.with_shell("xsel | xsel -i -b") end,
              {description = "copy terminal to gtk", group = "System"}),

  -- Copy clipboard to primary (gtk to terminals)

    awful.key({ modkey }, "v", function ()
	awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "copy gtk to terminal", group = "System"}),

  -- Clipboard Manager

    awful.key({ modkey, "Shift"}, "c",
        function () awful.util.spawn_with_shell("xfce4-clipman-history") end,
                {description = "Clipboard", group = "System"}),

-- Hotkey Popup

    awful.key({ modkey,           }, "s",
	hotkeys_popup.show_help,
              {description="show help", group="System"}),

-- logout popup

    awful.key({ modkey, "Shift" }, "q",
	function() logout_popup.launch() end,
	      {description = "Show logout screen", group = "System"}),
--[[
-- Show/Hide Wibox Bottom

    awful.key({ modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
	      {description = "toggle bottom wibox", group = "System"}),
--]]
-- Show/Hide Wibox (top and bottom)

    awful.key({ modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mytopwibox then
                    s.mytopwibox.visible = not s.mytopwibox.visible
                end
            end
        end,
              {description = "toggle top wibox", group = "System"}),

-- Show/Hide Wibox Borders

    awful.key({ modkey, "Shift", }, "b", function ()
            for s in screen do
               s.borderwibox.visible = not s.borderwibox.visible
                if s.topborderwibox then
                    s.topborderwibox.visible = not s.topborderwibox.visible
                end
            end
        end,
              {description = "toggle top wibox border", group = "System"}),

-- s.topborderwibox

-- Xkill

    awful.key({ "Control", "Shift" }, "Escape",
	function () awful.spawn(string.format("xkill")) end,
              {description = "xkill", group = "System"}),

-- Xrandr Multi Monitor Fix

    awful.key({ modkey,  }, "=",
        function() xrandr.xrandr() end,
              {description = "multi monitor toggle", group = "System"}),

        --
        -- Tag
        --

   awful.key({ modkey, "Control"    }, "Left",
	awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

   awful.key({ modkey,  "Control"   }, "Right",
	awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    awful.key({ modkey,           }, "Escape",
	awful.tag.history.restore,
              {description = "go back", group = "tag"}),

--new
--    awful.key({ modkey,           }, "e",      revelation),

-- Client Navigation (clientkeys)

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next client", group = "Client Navigation"}
    ),

    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous client", group = "Client Navigation"}
    ),

    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next client", group = "Client Navigation"}
    ),

--    awful.key({ modkey,           }, "k",
--        function ()
--            awful.client.focus.byidx(-1)
--        end,
--        {description = "focus previous client", group = "Client Navigation"}
--    ),




        -- By direction client focus with arrows
	awful.key({ modkey,     }, "Down",
            function()
                awful.client.focus.global_bydirection("down")
                if client.focus then client.focus:raise() end
            end,
            {description = "focus down", group = "Client Navigation"}),

	awful.key({ modkey,     }, "Up",
            function()
                awful.client.focus.global_bydirection("up")
                if client.focus then client.focus:raise() end
            end,
            {description = "focus up", group = "Client Navigation"}),

   	awful.key({ modkey,     }, "Left",
            function()
                awful.client.focus.global_bydirection("left")
                if client.focus then client.focus:raise() end
            end,
            {description = "focus left", group = "Client Navigation"}),

	awful.key({ modkey,     }, "Right",
            function()
                awful.client.focus.global_bydirection("right")
                if client.focus then client.focus:raise() end
             end,
            {description = "focus right", group = "Client Navigation"}),


-- Client Swap (clientkeys)


    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client", group = "Client-Swap"}),

    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client", group = "Client-Swap"}),

    awful.key({ modkey, altkey }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "Screen"}),

    awful.key({ modkey, altkey }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "Screen"}),

    awful.key({ modkey, altkey }, "Right", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "Screen"}),

    awful.key({ modkey, altkey }, "Left", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "Screen"}),

    awful.key({ modkey, }, ".", function () awful.screen.focus (1) end,
              {description = "focus on Screen 1", group = "Screen"}),

    awful.key({ modkey, }, "/", function () awful.screen.focus (2) end,
              {description = "focus the Screen 2", group = "Screen"}),

    awful.key({ modkey, }, ",", function () awful.screen.focus (3) end,
              {description = "focus the Screen 3", group = "Screen"}),


    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "Client Navigation"}),

    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "Client Navigation"}),


-- Layout


    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    awful.key({ modkey, "Control" }, "right",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey, "Control" }, "left",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),


    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),


-- Client Min/Max Global
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "Client"})


)

--[[

  ▜ ▘    ▗
▛▘▐ ▌█▌▛▌▜▘
▙▖▐▖▌▙▖▌▌▐▖

--]]


clientkeys = my_table.join(


                --
                -- Client (clientkeys)
                --


-- 		Fullscreen: Modkey f

    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "Client"}),

--		Quit Program: Modkey q

    awful.key({ modkey,   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "Client"}),

--    awful.key({ modkey,   }, "q",      function (c) c:kill()                         end,
--        function ()
--            awful.client.focus.byidx( 1)
--        end,
--              {description = "close", group = "Client"}),

--		Toggle Floating: Modkey Control Space

    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle,
              {description = "toggle floating", group = "Client"}),

--	Toggle keep on top:	modkey t

    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "Client"}),

--	Minimize:		modkey m

    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "Client"}),

--	Unmaximize:		modkey m

    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "Client"}),


--	Unmaximize vertically:	modkey control m

    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "Client"}),


--	Unmaximize
--	Horizontally:		modkey shift m

    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "Client"}),



                --
                -- Client Swap (clientkeys)
                --


    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "Client-Swap"}),

    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen(prev)   end,
              {description = "move client to next screen", group = "Client-Swap"}),

    awful.key({ modkey,           }, "i",      function (c) c:move_to_screen()   end,
              {description = "move client to previous screen", group = "Client-Swap"}),

    awful.key({ modkey,  "Shift"  }, ".",      function (c) c:move_to_screen(1)  end,
              {description = "move client to screen 1", group = "Client-Swap"}),

    awful.key({ modkey,  "Shift"  }, "/",      function (c) c:move_to_screen(2)  end,
              {description = "move client to screen 2", group = "Client-Swap"}),

    awful.key({ modkey,  "Shift"  }, ",",      function (c) c:move_to_screen(3)  end,
              {description = "move client to screen 3", group = "Client-Swap"}),


                --
                -- Screen
                --


    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()   end,
              {description = "move client to next screen", group = "Screen"}),

    awful.key({ modkey,  "Shift"  }, ",",      function (c) c:move_to_screen(1)  end,
              {description = "move client to next screen", group = "Screen"}),

    awful.key({ modkey,  "Shift"  }, ".",      function (c) c:move_to_screen(2)  end,
              {description = "move client to screen 2", group = "Screen"}),

    awful.key({ modkey,  "Shift"  }, "/",      function (c) c:move_to_screen(3)  end,
              {description = "move client to screen 3", group = "Screen"}),



                --
                -- System (clientkeys)
                --

-- Show/Hide Titlebars Client

   awful.key({ modkey,  }, "t", function (c) awful.titlebar.toggle(c)         end,
 {description = "toggle titlebar", group = "System"}),


                --
                -- Client Resize (clientkeys)
                --

    awful.key({ altkey, "Shift" }, "Up", function (c)
      if c.floating then
        c:relative_move( 0, 0, 0, -10)
      else
        awful.client.incwfact(0.025)
      end
    end,
    {description = "Floating Resize Vertical -", group = "Client-Resize"}),

    awful.key({ altkey, "Shift" }, "Down", function (c)
      if c.floating then
        c:relative_move( 0, 0, 0,  10)
      else
        awful.client.incwfact(-0.025)
      end
    end,
    {description = "Floating Resize Vertical +", group = "Client-Resize"}),

    awful.key({ altkey, "Shift" }, "Left", function (c)
      if c.floating then
        c:relative_move( 0, 0, -10, 0)
      else
        awful.tag.incmwfact(-0.025)
      end
    end,
    {description = "Floating Resize Horizontal -", group = "Client-Resize"}),

    awful.key({ altkey, "Shift" }, "Right", function (c)
   -- awful.key({ modkey, "Control" }, "Right", function (c)
      if c.floating then
        c:relative_move( 0, 0,  10, 0)
      else
        awful.tag.incmwfact(0.025)
      end
    end,
    {description = "Floating Resize Horizontal +", group = "Client-Resize"}),


                --
                -- Client Floating
                --

-- Moving floating windows

    awful.key({ modkey, altkey   }, "Down", function (c)
      c:relative_move(  0,  10,   0,   0) end,
    {description = "Floating Move Down", group = "Client-floating"}),

    awful.key({ modkey, altkey   }, "Up", function (c)
      c:relative_move(  0, -10,   0,   0) end,
    {description = "Floating Move Up", group = "Client-floating"}),

    awful.key({ modkey, altkey   }, "Left", function (c)
      c:relative_move(-10,   0,   0,   0) end,
    {description = "Floating Move Left", group = "Client-floating"}),

    awful.key({ modkey, altkey   }, "Right", function (c)
      c:relative_move( 10,   0,   0,   0) end,
    {description = "Floating Move Right", group = "Client-floating"}),


                --
                -- Client Navigation (clientkeys)
                --

--[[
this is in global keys too... without vim keys i think

    	-- Moving window focus works between desktops

   awful.key({ modkey,           }, "j", function (c)
     awful.client.focus.global_bydirection("down")
     c:lower()
   end,
   {description = "focus next window up", group = "Client Navigation"}),

  awful.key({ modkey,           }, "k", function (c)
     awful.client.focus.global_bydirection("up")
     c:lower()
   end,
  {description = "focus next window down", group = "Client Navigation"}),

   awful.key({ modkey,           }, "l", function (c)
     awful.client.focus.global_bydirection("right")
     c:lower()
   end,
  {description = "focus next window right", group = "Client Navigation"}),

    awful.key({ modkey,           }, "h", function (c)
      awful.client.focus.global_bydirection("left")
      c:lower()
    end,
    {description = "focus next window left", group = "Client Navigation"}),

--]]

                --
                -- Client Swap (clientkeys)
                --

-- Moving windows works between desktops

    awful.key({ modkey, "Shift"   }, "Left", function (c)
      awful.client.swap.global_bydirection("left")
      c:raise()
    end,
    {description = "swap with left client", group = "Client-Swap"}),

    awful.key({ modkey, "Shift"   }, "Right", function (c)
      awful.client.swap.global_bydirection("right")
      c:raise()
    end,
    {description = "swap with right client", group = "Client-Swap"}),

    awful.key({ modkey, "Shift"   }, "Down", function (c)
      awful.client.swap.global_bydirection("down")
      c:raise()
    end,
    {description = "swap with down client", group = "Client-Swap"}),

    awful.key({ modkey, "Shift"   }, "Up", function (c)
      awful.client.swap.global_bydirection("up")
      c:raise()
    end,
    {description = "swap with up client", group = "Client-Swap"})

)


                --
                -- Virtual Desktop Keybindings
                --

    -- Bind all key numbers to tags.


--[[
Original


 for i = 1, 9 do

    globalkeys = gears.table.join(globalkeys,

        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),

--]]

-- Attempt
 for i = 1, 9 do

    globalkeys = gears.table.join(globalkeys,

        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),


--[[
--experimental tag wallpaper swticher

for s = 1, screen.count() do
    for t = 1, 9 do
        tags[s][t]:add_signal("property::selected", function (tag)
            if not tag.selected then return end
            wallpaper_cmd = "awsetbg /home/user/Pictures/wallpaper" .. t .. ".png"
            awful.util.spawn(wallpaper_cmd)
        end)
    end
end

-- doesn't work... suprise...
--]]


--        -- Toggle tag display.
--        awful.key({ modkey, "Control" }, "#" .. i + 9,
--                  function ()
--                      local screen = awful.screen.focused()
--                      local tag = screen.tags[i]
--                      if tag then
--                         awful.tag.viewtoggle(tag)
--                      end
--                  end,
--                  {description = "toggle tag #" .. i, group = "tag"}),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"})
-- ,
--        -- Toggle tag on focused client.
--        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
--                  function ()
--                      if client.focus then
--                          local tag = client.focus.screen.tags[i]
--                          if tag then
--                              client.focus:toggle_tag(tag)
--                          end
--                      end
--                  end,
--                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)


--[[

 ____             ___                    
/\  _`\          /\_ \                   
\ \ \L\ \  __  __\//\ \      __    ____  
 \ \ ,  / /\ \/\ \ \ \ \   /'__`\ /',__\ 
  \ \ \\ \\ \ \_\ \ \_\ \_/\  __//\__, `\
   \ \_\ \_\ \____/ /\____\ \____\/\____/
    \/_/\/ /\/___/  \/____/\/____/\/___/ 
                                         
                                        
--]]

--              Rules

--   musicwidget:append_global_keys()

    -- Set keys

root.keys(globalkeys)

    -- Rules to apply to new clients (through the "manage" signal).

awful.rules.rules = {

    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },





-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- File   Edit   View                         ^ _ x
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Titlebars

    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = false } },

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1 2 3 4 5 6 7 8 9 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- tags

    -- Set applications to be maximized at startup
    -- Set where applications spawn (specific screens/tags)
    -- Toggle titlebars on certain clients
    -- Find class, name or role via xprop command

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Tag 1
                -- Screen 1

-- Rocket League
    { rule = { class = "steam_app_252950" },
      properties = { screen = 1, tag = "1", fullscreen = true } },
--    { rule = { name = "Rocket League (64-bit, DX11, Cooked)" },
--      properties = { screen = 1, tag = "2", fullscreen = true } },
--    { rule = { class = "rocketleague.exe" },
--      properties = { screen = 1, tag = "1", fullscreen = true } },

                -- Screen 2

    -- Brave Browser

    { rule = { instance = "brave" },
      properties = { screen = 3, tag = "1" }},



--    { rule = { class = "terminator" },
--      properties = { screen = 1, tag = "1" } },

    { rule = { class = "qt5ct" },
      properties = { screen = 1, tag = "1" } },

    { rule = { class = "grub-customizer" },
      properties = { screen = 1, tag = "1" } },

                -- Screen 3

    { rule = { instance = "discord" },
      properties = { screen = 2, tag = "1" } },

    { rule = { class = "spotify" },
      properties = { screen = 2, tag = "1" } },

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Tag 2
                -- Screen 1

        -- Steam
    { rule = { class = "Steam" },
      properties = { screen = 1, tag = "2" } },

    { rule = { name = "Friends List" },
      properties = { screen = 1, tag = "2" } },

    { rule = { name = "Steam - News" },
      properties = { screen = 1, tag = "2" } },

    { rule = { name = "Steam - News (1 of 4)" },
      properties = { screen = 1, tag = "2" } },

    { rule = { name = "Steam - News (1 of 3)" },
      properties = { screen = 1, tag = "2" } },

    { rule = { name = "Steam - News (1 of 2)" },
      properties = { screen = 1, tag = "2" } },



                -- Screen 2

    -- Firefox

    { rule = { class = "firefox" },
      properties = { screen = 3, tag = "2", fullsreen = true }},

                -- Screen 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Tag 3
                -- Screen 1

    -- File Explorers

    { rule = { class = "dolphin" },
      properties = { screen = 1, tag = "3" } },

    { rule = { instance = "pcmanfm" },
      properties = { screen = 1, tag = "3" } },

    { rule = { instance = "thunar" },
      properties = { screen = 1, tag = "3" } },

                -- Screen 2

    -- Chromium

    { rule = { instance = "chromium" },
      properties = { screen = 3, tag = "3" }},

                -- Screen 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Tag 4

                -- Screen 1


                -- Screen 2

    -- Librewolf

    { rule = { class = "librewolf" },
      properties = { screen = 3, tag = "4" }},

                -- Screen 3

    	-- Image, Video and RSS Clients

    { rule = { class = "mpv" },
      properties = { screen = 2, tag = "4" } },

    { rule = { class = "newsboat" },
      properties = { screen = 2, tag = "4" } },

    { rule = { class = "shotwell" },
      properties = { screen = 2, tag = "4" } },

    { rule = { class = "vlc" },
      properties = { screen = 2, tag = "4" } },

-- ~~~~~~~~~~~~~ Tag 5 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

                            -- Screen 1

	-- Design/Creation

    { rule = { class = "audacity" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "ascii-design" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "blender" },
      properties = { screen = 1, tag = "5" } },

    { rule = { instance = "gimp" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "guvcview" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "handbrake" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "inkscape" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "kdenlive" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "lmms" },
      properties = { screen = 1, tag = "5" } },

    { rule = { class = "obs-studio" },
      properties = { screen = 1, tag = "5" } },

                        -- Screen 2

                        -- Screen 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Tag 6
                -- Screen 1

    { rule = { instance = "deadbeef" },
      properties = { screen = 1, tag = "6" } },

    { rule = { instance = "rhythmbox" },
      properties = { screen = 1, tag = "6" } },

    { rule = { instance = "ncmpcpp" },
      properties = { screen = 1, tag = "6" } },

                -- Screen 2

                -- Screen 3

		-- Music / Social

    { rule = { instance = "telegram-desktop" },
      properties = { screen = 1, tag = "4" } },
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Tag 7

                -- Screen 1

    { rule = { class = "libreoffice-writer" },
      properties = { screen = 1, tag = "7"  }},

    { rule = { class = "libreoffice-impress" },
      properties = { screen = 1, tag = "7"  }},

                -- Screen 2

                -- Screen 3

    { rule = { class = "VirtualBox Machine" },
      properties = { screen = 2, tag = "7",
        floating = true, titlebars_enabled = true }},

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Tag 8
                -- Screen 1

    -- Text Editors

    { rule = { instance = "kate" },
      properties = { screen = 1, tag = "8" } },

    { rule = { instance = "kwrite" },
      properties = { screen = 1, tag = "8" } },

    { rule = { instance = "notepadqq" },
      properties = { screen = 1, tag = "8" } },


                -- Screen 2

                -- Screen 3
	
		

		-- Mail

    { rule = { instance = "claws-mail" },
      properties = { screen = 3, tag = "5" } },

    { rule = { instance = "geary" },
      properties = { screen = 3, tag = "5" } },

    { rule = { instance = "kmail" },
      properties = { screen = 3, tag = "5" } },

	-- thunderbird
    { rule = { instance = "Thunderbird" },
      properties = { screen = 3, tag = "5" } },
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Tag 9 (Floating)

                -- Screen 1
    { rule = { instance = "xfce4-power-manager-settings" },
      properties = { screen = 1, floating = true, tag = "9" } },
                -- Screen 2

    { rule = { instance = "veracrypt" },
      properties = { screen = 3, tag = "9", floating = true }},

    { rule = { instance = "pulseaudio-equalizer-gtk" },
      properties = { screen = 3, tag = "9" } },
                -- Screen 3

    { rule = { class = "VirtualBox Manager" },
      properties = { screen = 3, tag = "9",
        floating = true }},   

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Other Rules

--    { rule = { class = editorgui },
--          properties = { maximized = true } },
--
--   { rule = { class = "Gimp*", role = "gimp-image-window" },
--          properties = { maximized = true } },
--
--    { rule = { class = mediaplayer },
--          properties = { maximized = true } },


    { rule = { instance = "gnome-calculator" },
      properties = { screen = 1, floating = true } },

    { rule = { name = "Clocks" },
      properties = { floating = true } },

    { rule = { instance = "fsearch" },
      properties = { screen = 1, floating = true } },

    { rule = { instance = "keepassxc" },
      properties = { screen = 3, floating = true }},

    { rule = { instance = "authy desktop" },
	properties = { floating = true, titlebars_enabled = true }},

    { rule = { instance = "xfce4-clipman-history" },
      properties = {floating = true }},
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    -- Floating clients.

    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
	  "virtualbox",
	  "librewolf",
        },

        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
		},


        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
	  "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},


 }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--          Signals

    -- Signal function to execute when a new client appears.

client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)


--       Add a titlebar if titlebars_enabled is set to true in the rules.

client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)



--              Enable sloppy focus, so that focus follows mouse.

--client.connect_signal("mouse::enter", function(c)
--    c:emit_signal("request::activate", "mouse_enter", {raise = false})
--end)
--
--client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
--client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--	   _         _            _             _
--	  /_\  _   _| |_ ___  ___| |_ __ _ _ __| |_ 
--	 //_\\| | | | __/ _ \/ __| __/ _` | '__| __|
--	/  _  \ |_| | || (_) \__ \ || (_| | |  | |_ 
--	\_/ \_/\__,_|\__\___/|___/\__\__,_|_|   \__|
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	 	-- Autostart Multi Monitors:
		
	-- you must find your currently active displays and with the bash command xrandr
	-- and replace the "--output (ex. DP-5)" to whatever xrandr displays 

-- 2 monitors

    -- Standard
-- awful.spawn.with_shell("xrandr --output DP-5 --primary --mode 1920x1080 --rate 144.00 --output DP-1-1 --mode 1920x1080 --rate 144.00 --right-of DP-5 ")
    -- Right Vertical
-- awful.spawn.with_shell("xrandr --output DP-5 --primary --mode 1920x1080 --rate 144.00 --output DP-1-1 --mode 1920x1080 --rate 144.00 --right-of DP-5 --rotate right")

-- 3 Monitors
	-- Standard
--awful.spawn.with_shell("xrandr --output DP-5 --primary --mode 1920x1080 --rate 144.00 --output DP-1-1 --mode 1920x1080 --rate 144.00 --right-of DP-5 --output DP-1-2 --mode 1920x1080  --rate 144.00 --right-of DP-1-1")
	-- Right Vertical
-- Noveaou driver... for Nvidia configure via nvidia-settings (terminal: sudo nvidia-settings)

--working
--awful.spawn.with_shell("xrandr --output DP-5 --primary --mode 1920x1080 --rate 144.00 --output DP-1-1 --mode 1920x1080 --rate 144.00 --right-of DP-5 --output DP-1-2 --mode 1920x1080 --rotate right --rate 144.00 --right-of DP-1-1")

--above test
awful.spawn.with_shell("xrandr --output DP-5 --primary --mode 1920x1080 --rate 144.00 --output DP-1-1 --mode 1920x1080 --rate 144.00 --above DP-5 --output DP-1-2 --mode 1920x1080 --rotate right --rate 144.00 --right-of DP-1-1")
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 	    Autostart Applications
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Screen Compositor
    -- Picom
        -- Normal
--awful.spawn.with_shell("picom")
        -- Experimental Backends
awful.spawn.with_shell("picom --experimental-backends")

-- Wallpaper
  -- Theme wallpaper directory (at boot and WM restart) **if you restart the wm within 3 minutes, you will have 2 instances of nitrogen (after 3 minutes)**
-- awful.spawn.with_shell("pkill nitrogen && ~/.config/awesome/scripts/nitrogen/nitrogen-jerms-red-static.sh && pkill nitrogen")
awful.spawn.with_shell("pkill nitrogen")
awful.spawn.with_shell("sleep 0.5 && ~/.config/awesome/scripts/nitrogen/nitrogen-jerms-red-static.sh")
  -- Wallpapers directory (after 3 minutes)
awful.spawn.with_shell("sleep 120 && ~/.config/awesome/scripts/nitrogen/nitrogen.sh")

-- WiFi / Bluetooth
    -- Network Manager Icon
awful.spawn.with_shell("nm-applet")
    -- Disable Wifi at boot
awful.spawn.with_shell("rfkill block wifi")
    -- Bluetooth Icon
awful.spawn.with_shell("blueman-applet") --disabled in systemd at the moment
    -- Disable Bluetooth at boot
-- awful.spawn.with_shell("sleep 2 && rfkill block bluetooth")
awful.spawn.with_shell("rfkill block bluetooth")
-- Audio
    -- Pulse Audio Volume Icon
awful.spawn.with_shell("pkill pasystray")
awful.spawn.with_shell("sleep 3 && pasystray")
    -- Set default audio at boot
        -- Headphones
--awful.spawn.with_shell("pacmd set-default-sink 2")
        -- Speakers
awful.spawn.with_shell("pacmd set-default-sink 3")
    -- Mictray Microphone System Tray
        -- https://github.com/Junker/MicTray
awful.spawn.with_shell("mictray")
        -- Mute Microphone at boot
awful.spawn.with_shell("amixer set Capture nocap")

-- Eye Comfort
    -- Redshift Brightness and Color Utility
        -- Kill existing redshift processes
awful.spawn.with_shell("pkill redshift && pkill redshift-gtk")
        -- Launch redshift via config file
awful.spawn.with_shell("redshift-gtk -c ~/.config/redshift/redshift.conf")
        -- Others
--awful.spawn.with_shell("redshift-gtk -l $LAT:$LONG -b 0.6")

-- Clipboard qlipper (AUR) (github.com/pvanek/qlipper)
-- awful.spawn.with_shell("pkill qlipper")
awful.spawn.with_shell("qlipper") 

-- mpDris2 (AUR) for mpd image imbedded songs
awful.spawn.with_shell("mpDris2")

-- Number Lock
awful.spawn.with_shell("numlockx")



-- Unused (make sure they are installed on your system as they are not part of the install script

-- KDE Kmix Volume Control
-- awful.spawn.with_shell("kmix")

-- XFCE4 Clipboard Manager
-- awful.spawn.with_shell("xfce4-clipman")

-- XFCE4 Volume Icon
-- awful.spawn.with_shell("volumeicon")

-- XFCE4 Power Manager Icon
-- awful.spawn.with_shell("xfce4-power-manager")


-- {{{ Naughty
-- Fuck off spotify i hate your shitty enormous notifications.
--naughty.config.presets.spotify = {callback = function() return false end}
--table.insert(naughty.config.mapping, {{appname = "Spotify"}, naughty.config.presets.spotify})
-- }}}

--[[
local last_focus
client.connect_signal("unfocus", function(c) last_focus = c end)
client.connect_signal("focus", function(c) last_focus = nil end)
client.connect_signal("unmanage", function(c)
    if last_focus == c and c.transient_for then
        client.focus = c.transient_for
        c.transient_for:raise()
    end
end)

--]]


