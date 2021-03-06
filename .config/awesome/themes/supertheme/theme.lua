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
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.wallpaper                                 = theme.dir .. "/wall.png"
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
theme.awesome_icon                              = theme.dir .."/icons-mytheme/awesome-red.png"


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
theme.taglist_squares_sel                       = theme.dir .. "/icons-mytheme/square_sel-red.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-mytheme/square_unsel-white.png"
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
theme.menu_submenu_icon                         = theme.dir .. "/icons-mytheme/submenu.png"

-- ~~~~~~~~~~~~~~~~~
-- Layout Icon Theme
-- ~~~~~~~~~~~~~~~~~
theme.layout_tile                               = theme.dir .. "/icons-mytheme/tile-red.png"
theme.layout_tileleft                           = theme.dir .. "/icons-mytheme/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons-mytheme/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons-mytheme/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons-mytheme/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons-mytheme/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons-mytheme/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons-mytheme/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons-mytheme/max-red.png"
theme.layout_fullscreen                         = theme.dir .. "/icons-mytheme/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons-mytheme/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons-mytheme/floating-red.png"

-- ~~~~~~~~~~~~~~~~~~
-- Window Border Gaps
-- ~~~~~~~~~~~~~~~~~~
theme.useless_gap                               = "4"

-- ~~~~~~~~~~~~~~
-- Titlebar Theme
-- ~~~~~~~~~~~~~~
theme.titlebar_close_button_focus               = theme.dir .. "/icons-mytheme/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons-mytheme/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons-mytheme/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons-mytheme/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons-mytheme/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons-mytheme/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons-mytheme/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons-mytheme/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons-mytheme/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons-mytheme/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons-mytheme/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons-mytheme/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons-mytheme/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons-mytheme/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons-mytheme/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons-mytheme/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons-mytheme/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons-mytheme/titlebar/maximized_normal_inactive.png"


--
-- BLACKBURN THEME
--

--[[

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Terminus 10.5"
theme.taglist_font                              = "Icons 10"
theme.fg_normal                                 = "#D7D7D7"
theme.fg_focus                                  = "#F6784F"
theme.bg_normal                                 = "#060606"
theme.bg_focus                                  = "#060606"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#2A1F1E"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#0E0E0E"
theme.border_focus                              = "#F79372"
theme.taglist_fg_focus                          = "#F6784F"
theme.taglist_bg_focus                          = "#060606"
theme.tasklist_fg_focus                         = "#F6784F"
theme.tasklist_bg_focus                         = "#060606"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.dir .. "/icons-blackburn/submenu.png"
theme.awesome_icon                              = theme.dir .."/icons-blackburn/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons-blackburn/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-blackburn/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons-blackburn/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons-blackburn/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons-blackburn/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons-blackburn/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons-blackburn/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons-blackburn/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons-blackburn/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons-blackburn/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons-blackburn/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons-blackburn/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons-blackburn/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons-blackburn/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0
theme.titlebar_close_button_focus               = theme.dir .. "/icons-blackburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons-blackburn/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons-blackburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons-blackburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons-blackburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons-blackburn/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons-blackburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons-blackburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons-blackburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons-blackburn/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons-blackburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons-blackburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons-blackburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons-blackburn/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons-blackburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons-blackburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons-blackburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons-blackburn/titlebar/maximized_normal_inactive.png"

-- awful.util.tagnames   = { "??", "??", "??", "??", "??" }

--local markup     = lain.util.markup
--local separators = lain.util.separators
--local gray       = "#9E9C9A"

--]]


-- 
-- COPLAND THEME
--

--[[

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.wallpaper                                 = theme.dir .. "/wall-copland.png"
theme.font                                      = "Terminus 10.5"
theme.fg_normal                                 = "#BBBBBB"
theme.fg_focus                                  = "#78A4FF"
theme.bg_normal                                 = "#111111"
theme.bg_focus                                  = "#111111"
theme.fg_urgent                                 = "#000000"
theme.bg_urgent                                 = "#FFFFFF"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#141414"
theme.border_focus                              = "#93B6FF"
theme.taglist_fg_focus                          = "#FFFFFF"
theme.taglist_bg_focus                          = "#111111"
theme.taglist_bg_normal                         = "#111111"
theme.titlebar_bg_normal                        = "#191919"
theme.titlebar_bg_focus                         = "#262626"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.tasklist_disable_icon                     = true
theme.awesome_icon                              = theme.dir .."/icons-copland/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons-copland/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons-copland/square_unsel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-copland/square_unsel.png"
theme.vol                                       = theme.dir .. "/icons-copland/vol.png"
theme.vol_low                                   = theme.dir .. "/icons-copland/vol_low.png"
theme.vol_no                                    = theme.dir .. "/icons-copland/vol_no.png"
theme.vol_mute                                  = theme.dir .. "/icons-copland/vol_mute.png"
theme.disk                                      = theme.dir .. "/icons-copland/disk.png"
theme.ac                                        = theme.dir .. "/icons-copland/ac.png"
theme.bat                                       = theme.dir .. "/icons-copland/bat.png"
theme.bat_low                                   = theme.dir .. "/icons-copland/bat_low.png"
theme.bat_no                                    = theme.dir .. "/icons-copland/bat_no.png"
theme.play                                      = theme.dir .. "/icons-copland/play.png"
theme.pause                                     = theme.dir .. "/icons-copland/pause.png"
theme.stop                                      = theme.dir .. "/icons-copland/stop.png"
theme.layout_tile                               = theme.dir .. "/icons-copland/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons-copland/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons-copland/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons-copland/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons-copland/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons-copland/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons-copland/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons-copland/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons-copland/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons-copland/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons-copland/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons-copland/floating.png"
theme.useless_gap                               = 0
theme.titlebar_close_button_focus               = theme.dir .. "/icons-copland/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons-copland/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons-copland/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons-copland/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons-copland/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons-copland/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons-copland/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons-copland/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons-copland/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons-copland/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons-copland/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons-copland/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons-copland/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons-copland/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons-copland/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons-copland/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons-copland/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons-copland/titlebar/maximized_normal_inactive.png"

-- lain related
theme.layout_centerfair                         = theme.dir .. "/icons-copland/centerfair.png"
theme.layout_termfair                           = theme.dir .. "/icons-copland/termfair.png"
theme.layout_centerwork                         = theme.dir .. "/icons-copland/centerwork.png"

--local markup = lain.util.markup
--local blue   = theme.fg_focus
--local red    = "#EB8F8F"
--local green  = "#8FEB8F"

--]]

--
-- DREMORA THEME
--

--[[
local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Terminus 10.5"
theme.taglist_font                              = "Icons 10"
theme.fg_normal                                 = "#747474"
theme.fg_focus                                  = "#DDDCFF"
theme.bg_normal                                 = "#121212"
theme.bg_focus                                  = "#121212"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#2A1F1E"
theme.border_width                              = dpi(0)
theme.border_normal                             = "#121212"
theme.border_focus                              = "#292929"
theme.titlebar_bg_focus                         = "#292929"
theme.taglist_fg_focus                          = "#dddcff"
theme.taglist_bg_focus                          = "#121212"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.dir .. "/icons-dremora/submenu.png"
theme.awesome_icon                              = theme.dir .."/icons-dremora/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons-dremora/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-dremora/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons-dremora/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons-dremora/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons-dremora/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons-dremora/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons-dremora/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons-dremora/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons-dremora/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons-dremora/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons-dremora/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons-dremora/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons-dremora/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons-dremora/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(10)
theme.titlebar_close_button_focus               = theme.dir .. "/icons-dremora/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons-dremora/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons-dremora/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons-dremora/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons-dremora/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons-dremora/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons-dremora/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons-dremora/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons-dremora/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons-dremora/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons-dremora/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons-dremora/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons-dremora/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons-dremora/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons-dremora/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons-dremora/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons-dremora/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons-dremora/titlebar/maximized_normal_inactive.png"

-- awful.util.tagnames   = { "??", "??", "??", "??", "??" }

--local markup     = lain.util.markup
--local separators = lain.util.separators
--local white      = theme.fg_focus
--local gray       = "#858585"

--]]

--
-- HOLO THEME
--

--[[

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/supertheme/icons-holo"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/supertheme/wall-holo.png"
theme.font                                      = "Roboto Bold 10"
theme.taglist_font                              = "Roboto Condensed Regular 8"
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#0099CC"
theme.bg_focus                                  = "#303030"
theme.bg_normal                                 = "#242424"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"
theme.border_width                              = dpi(3)
theme.border_normal                             = "#252525"
theme.border_focus                              = "#0099CC"
theme.taglist_fg_focus                          = "#FFFFFF"
theme.tasklist_bg_normal                        = "#222222"
theme.tasklist_fg_focus                         = "#4CB7DB"
theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(160)
theme.menu_icon_size                            = dpi(32)
theme.awesome_icon                              = theme.icon_dir .. "/awesome_icon_white.png"
theme.awesome_icon_launcher                     = theme.icon_dir .. "/awesome_icon.png"
theme.taglist_squares_sel                       = theme.icon_dir .. "/square_sel.png"
theme.taglist_squares_unsel                     = theme.icon_dir .. "/square_unsel.png"
theme.spr_small                                 = theme.icon_dir .. "/spr_small.png"
theme.spr_very_small                            = theme.icon_dir .. "/spr_very_small.png"
theme.spr_right                                 = theme.icon_dir .. "/spr_right.png"
theme.spr_bottom_right                          = theme.icon_dir .. "/spr_bottom_right.png"
theme.spr_left                                  = theme.icon_dir .. "/spr_left.png"
theme.bar                                       = theme.icon_dir .. "/bar.png"
theme.bottom_bar                                = theme.icon_dir .. "/bottom_bar.png"
theme.mpdl                                      = theme.icon_dir .. "/mpd.png"
theme.mpd_on                                    = theme.icon_dir .. "/mpd_on.png"
theme.prev                                      = theme.icon_dir .. "/prev.png"
theme.nex                                       = theme.icon_dir .. "/next.png"
theme.stop                                      = theme.icon_dir .. "/stop.png"
theme.pause                                     = theme.icon_dir .. "/pause.png"
theme.play                                      = theme.icon_dir .. "/play.png"
theme.clock                                     = theme.icon_dir .. "/clock.png"
theme.calendar                                  = theme.icon_dir .. "/cal.png"
theme.cpu                                       = theme.icon_dir .. "/cpu.png"
theme.net_up                                    = theme.icon_dir .. "/net_up.png"
theme.net_down                                  = theme.icon_dir .. "/net_down.png"
theme.layout_tile                               = theme.icon_dir .. "/tile.png"
theme.layout_tileleft                           = theme.icon_dir .. "/tileleft.png"
theme.layout_tilebottom                         = theme.icon_dir .. "/tilebottom.png"
theme.layout_tiletop                            = theme.icon_dir .. "/tiletop.png"
theme.layout_fairv                              = theme.icon_dir .. "/fairv.png"
theme.layout_fairh                              = theme.icon_dir .. "/fairh.png"
theme.layout_spiral                             = theme.icon_dir .. "/spiral.png"
theme.layout_dwindle                            = theme.icon_dir .. "/dwindle.png"
theme.layout_max                                = theme.icon_dir .. "/max.png"
theme.layout_fullscreen                         = theme.icon_dir .. "/fullscreen.png"
theme.layout_magnifier                          = theme.icon_dir .. "/magnifier.png"
theme.layout_floating                           = theme.icon_dir .. "/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(4)
theme.titlebar_close_button_normal              = theme.dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.dir.."/titlebar/maximized_focus_active.png"

-- theme.musicplr = string.format("%s -e ncmpcpp", awful.util.terminal)

--local markup = lain.util.markup
--local blue   = "#80CCE6"
--local space3 = markup.font("Roboto 3", " ")

--]]

--
-- MULTICOLOR THEME - NOT WORKING
--

--[[

local theme                                     = {}
theme.dir					= os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
-- theme.wallpaper                                 = theme.confdir .. "/wallpaper/wall-multicolor.png"
theme.font                                      = "Terminus 8"
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#000000"
theme.bg_focus                                  = "#000000"
theme.bg_urgent                                 = "#000000"
theme.fg_normal                                 = "#aaaaaa"
theme.fg_focus                                  = "#ff8c00"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#1c2022"
theme.border_focus                              = "#606060"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.confdir .. "/icons-multicolor/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp                               = theme.confdir .. "/icons-multicolor/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons-multicolor/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons-multicolor/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons-multicolor/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons-multicolor/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons-multicolor/mem.png"
theme.widget_note                               = theme.confdir .. "/icons-multicolor/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons-multicolor/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons-multicolor/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons-multicolor/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons-multicolor/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons-multicolor/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons-multicolor/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons-multicolor/spkr.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons-multicolor/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons-multicolor/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0
theme.layout_tile                               = theme.confdir .. "/icons-multicolor/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons-multicolor/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons-multicolor/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons-multicolor/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons-multicolor/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons-multicolor/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons-multicolor/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons-multicolor/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons-multicolor/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons-multicolor/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons-multicolor/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons-multicolor/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons-multicolor/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons-multicolor/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons-multicolor/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons-multicolor/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons-multicolor/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons-multicolor/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons-multicolor/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons-multicolor/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons-multicolor/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons-multicolor/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons-multicolor/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons-multicolor/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons-multicolor/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons-multicolor/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons-multicolor/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons-multicolor/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons-multicolor/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons-multicolor/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons-multicolor/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons-multicolor/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons-multicolor/titlebar/maximized_focus_active.png"

--local markup = lain.util.markup

--]]

--
-- POWERARROW THEME
--

--[[

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.wallpaper                                 = theme.dir .. "/wallaper-wall-powerarrow.jpg"
theme.font                                      = "Noto Sans Regular 11"
theme.taglist_font                              = "Noto Sans Regular 14"
theme.fg_normal                                 = "#FEFEFE"
theme.fg_focus                                  = "#7b88d3"
theme.fg_urgent                                 = "#b74822"
theme.bg_normal                                 = "#222222"
theme.bg_focus                                  = "#1E2320"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#7b88d3"
theme.tasklist_bg_focus                         = "#222222"
theme.tasklist_fg_focus                         = "#7b88d3"
theme.border_width                              = 2
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons-powerarrow/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons-powerarrow/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons-powerarrow/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-powerarrow/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons-powerarrow/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons-powerarrow/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons-powerarrow/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons-powerarrow/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons-powerarrow/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons-powerarrow/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons-powerarrow/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons-powerarrow/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons-powerarrow/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons-powerarrow/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons-powerarrow/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons-powerarrow/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons-powerarrow/ac.png"
theme.widget_battery                            = theme.dir .. "/icons-powerarrow/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons-powerarrow/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons-powerarrow/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons-powerarrow/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons-powerarrow/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons-powerarrow/temp.png"
theme.widget_net                                = theme.dir .. "/icons-powerarrow/net.png"
theme.widget_hdd                                = theme.dir .. "/icons-powerarrow/hdd.png"
theme.widget_music                              = theme.dir .. "/icons-powerarrow/note.png"
theme.widget_music_on                           = theme.dir .. "/icons-powerarrow/note.png"
theme.widget_music_pause                        = theme.dir .. "/icons-powerarrow/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons-powerarrow/stop.png"
theme.widget_vol                                = theme.dir .. "/icons-powerarrow/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons-powerarrow/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons-powerarrow/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons-powerarrow/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons-powerarrow/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons-powerarrow/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons-powerarrow/task.png"
theme.widget_scissors                           = theme.dir .. "/icons-powerarrow/scissors.png"
theme.widget_weather                            = theme.dir .. "/icons-powerarrow/dish.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 4
theme.titlebar_close_button_focus               = theme.dir .. "/icons-powerarrow/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons-powerarrow/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons-powerarrow/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons-powerarrow/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons-powerarrow/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons-powerarrow/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons-powerarrow/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons-powerarrow/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons-powerarrow/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons-powerarrow/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons-powerarrow/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons-powerarrow/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons-powerarrow/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons-powerarrow/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons-powerarrow/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons-powerarrow/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons-powerarrow/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons-powerarrow/titlebar/maximized_normal_inactive.png"

--local markup = lain.util.markup
--local separators = lain.util.separators

--]]

--
-- POWERARROW BLUE THEME 
--

--[[

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
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

--]]

--
-- POWERARROW DARK THEME
--

--[[

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.wallpaper                                 = theme.dir .. "/wallpaper/wall-powerarrow_dark.png"
theme.font                                      = "Terminus 9"
theme.fg_normal                                 = "#DDDDFF"
theme.fg_focus                                  = "#EA6F81"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#1A1A1A"
theme.bg_focus                                  = "#313131"
theme.bg_urgent                                 = "#1A1A1A"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#CC9393"
theme.tasklist_bg_focus                         = "#1A1A1A"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons-powerarrow_dark/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons-powerarrow_dark/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-powerarrow_dark/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons-powerarrow_dark/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons-powerarrow_dark/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons-powerarrow_dark/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons-powerarrow_dark/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons-powerarrow_dark/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons-powerarrow_dark/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons-powerarrow_dark/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons-powerarrow_dark/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons-powerarrow_dark/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons-powerarrow_dark/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons-powerarrow_dark/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons-powerarrow_dark/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons-powerarrow_dark/ac.png"
theme.widget_battery                            = theme.dir .. "/icons-powerarrow_dark/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons-powerarrow_dark/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons-powerarrow_dark/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons-powerarrow_dark/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons-powerarrow_dark/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons-powerarrow_dark/temp.png"
theme.widget_net                                = theme.dir .. "/icons-powerarrow_dark/net.png"
theme.widget_hdd                                = theme.dir .. "/icons-powerarrow_dark/hdd.png"
theme.widget_music                              = theme.dir .. "/icons-powerarrow_dark/note.png"
theme.widget_music_on                           = theme.dir .. "/icons-powerarrow_dark/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons-powerarrow_dark/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons-powerarrow_dark/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons-powerarrow_dark/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons-powerarrow_dark/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons-powerarrow_dark/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons-powerarrow_dark/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(0)
theme.titlebar_close_button_focus               = theme.dir .. "/icons-powerarrow_dark/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons-powerarrow_dark/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons-powerarrow_dark/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons-powerarrow_dark/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons-powerarrow_dark/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons-powerarrow_dark/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons-powerarrow_dark/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons-powerarrow_dark/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons-powerarrow_dark/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons-powerarrow_dark/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons-powerarrow_dark/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons-powerarrow_dark/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons-powerarrow_dark/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons-powerarrow_dark/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons-powerarrow_dark/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons-powerarrow_dark/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons-powerarrow_dark/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons-powerarrow_dark/titlebar/maximized_normal_inactive.png"

--local markup = lain.util.markup
--local separators = lain.util.separators

--local keyboardlayout = awful.widget.keyboardlayout:new()

--]]

--
-- RAINBOW THEME
--

--[[

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.wallpaper                                 = theme.dir .. "/wallpaper/wall-rainbow.png"
theme.font                                      = "Terminus 10.5"
theme.fg_normal                                 = "#9E9E9E"
theme.fg_focus                                  = "#EBEBFF"
theme.bg_normal                                 = "#242424"
theme.bg_focus                                  = "#242424"
theme.fg_urgent                                 = "#000000"
theme.bg_urgent                                 = "#FFFFFF"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#242424"
theme.border_focus                              = "#EBEBFF"
theme.taglist_fg_focus                          = "#EDEFFF"
theme.taglist_bg_focus                          = "#242424"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.ocol                                      = "<span color='" .. theme.fg_normal .. "'>"
theme.tasklist_sticky                           = theme.ocol .. "[S]</span>"
theme.tasklist_ontop                            = theme.ocol .. "[T]</span>"
theme.tasklist_floating                         = theme.ocol .. "[F]</span>"
theme.tasklist_maximized_horizontal             = theme.ocol .. "[M] </span>"
theme.tasklist_maximized_vertical               = ""
theme.tasklist_disable_icon                     = true
theme.awesome_icon                              = theme.dir .."/icons-rainbow/awesome.png"
theme.menu_submenu_icon                         = theme.dir .."/icons-rainbow/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons-rainbow/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons-rainbow/square_unsel.png"
theme.useless_gap                               = dpi(8)
theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[*]"
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

-- lain related
theme.layout_txt_cascade                        = "[cascade]"
theme.layout_txt_cascadetile                    = "[cascadetile]"
theme.layout_txt_centerwork                     = "[centerwork]"
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

--local markup = lain.util.markup
--local white  = theme.fg_focus
--local gray   = theme.fg_normal

--]]


--
-- STEAMBURN THEME  - Get zenburn
--

--[[

local theme                                     = {}
theme.zenburn_dir                               = require("awful.util").get_themes_dir() .. "zenburn"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Terminus 10.5"
theme.fg_normal                                 = "#e2ccb0"
theme.fg_focus                                  = "#d88166"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#140c0b"
theme.bg_focus                                  = "#140c0b"
theme.bg_urgent                                 = "#2a1f1e"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#302627"
theme.border_focus                              = "#c2745b"
theme.border_marked                             = "#CC9393"
theme.taglist_fg_focus                          = "#d88166"
theme.tasklist_bg_focus                         = "#140c0b"
theme.tasklist_fg_focus                         = "#d88166"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[|]"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(0)
theme.titlebar_close_button_normal              = theme.zenburn_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.zenburn_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.zenburn_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.zenburn_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.zenburn_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.zenburn_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.zenburn_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.zenburn_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.zenburn_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.zenburn_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.zenburn_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.zenburn_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.zenburn_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.zenburn_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.zenburn_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.zenburn_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.zenburn_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.zenburn_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.zenburn_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.zenburn_dir.."/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local gray   = "#94928F"

--]]

--
-- VERTEX THEME
--

--[[

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/supertheme"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/supertheme/icons-vertex"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/supertheme/wall-vertex.png"
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
--awful.util.tagnames = { "???", "???", "???", "???", "???", "???", "???", "???" }

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
-- Custom Systray
-- ~~~~~~~~~~~~~~
local custom_systray = wibox.widget {
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
--[[
-- Brightness - awesome-wm-widgets

	brightness_widget({
	program = 'light',
	base = 100,
	tooltip = true,
	step = 5
	}),
	
	space_4,
--]]

-- Volume - awesome-wm-widgets
        volume_widget(),
        space_4,

--[[        
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

--]]

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
	custom_systray,
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
