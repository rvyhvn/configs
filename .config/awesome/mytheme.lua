---------------------------
-- Default awesome theme --
---------------------------

-- Gruvbox colorscheme:
--[[
    #242424 #282828 #32302F #665c54
    #eebd35 #fabd2f #98971a #689d6a #8ec07c
    #d65d0e #fb4934 #cc241d #b16286 #d4879c
    #7fa2ac #83a598 #504945 #458588 #e7d7ad
]]

local theme_assets                              = require("beautiful.theme_assets")
local xresources                                = require("beautiful.xresources")
local dpi                                       = xresources.apply_dpi

local gfs                                       = require("gears.filesystem")
local themes_path                               = gfs.get_themes_dir()

local theme                                     = {}

theme.font                                      = "ComicShannsMono Nerd Font Propo 11"

theme.bg_normal                                 = "#242424"
theme.bg_focus                                  = "#458588"
theme.bg_urgent                                 = "#fb4934"
theme.bg_minimize                               = "#444444"
theme.bg_systray                                = theme.bg_normal

theme.fg_normal                                 = "#e7d7ad"
theme.fg_focus                                  = "#e7d7ad"
theme.fg_urgent                                 = "#242424"
theme.fg_minimize                               = "#e7d7ad"

theme.useless_gap                               = dpi(3)
theme.border_width                              = dpi(1)
theme.border_normal                             = "#242424"
theme.border_focus                              = "#fabd2f"
theme.border_marked                             = "#242424"

theme.taglist_bg_focus                          = "#b16286"
theme.taglist_bg_urgent                         = theme.fg_urgent
theme.taglist_bg_occupied                       = "#665c54"
theme.taglist_bg_empty                          = theme.bg_normal
-- theme.taglist_bg_volatile =
theme.taglist_fg_focus                          = theme.fg_normal
theme.taglist_fg_urgent                         = theme.fg_urgent
theme.taglist_fg_occupied                       = theme.fg_normal
theme.taglist_fg_empty                          = theme.fg_normal
-- theme.taglist_fg_volatile =

theme.tasklist_bg_focus                         = "#eebd35"
theme.tasklist_bg_urgent                        = theme.bg_urgent
theme.tasklist_fg_focus                         = "#242424"
theme.tasklist_fg_urgent                        = theme.fg_urgent

-- Generate taglist squares:
local taglist_square_size                       = dpi(4)
theme.taglist_squares_sel                       = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel                     = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- theme.notification_bg =
-- theme.notification_fg =
theme.notification_width                        = dpi(400)
theme.notification_height                       = dpi(100)
theme.notification_margin                       = dpi(5)
theme.notification_border_color                 = "#689d6a"
-- theme.notification_border_width =
-- theme.notification_shape =
-- theme.notification_opacity =

-- theme.menu_bg_normal =
-- theme.menu_bg_focus =
-- theme.menu_fg_normal =
-- theme.menu_fg_focus =
-- theme.menu_border_color =
-- theme.menu_border_width =
theme.menu_submenu_icon                         = themes_path .. "default/submenu.png"
theme.menu_height                               = dpi(15)
theme.menu_width                                = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal              = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal           = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path .. "default/titlebar/maximized_focus_active.png"

theme.wallpaper                                 = themes_path .. "default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh                              = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv                              = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating                           = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier                          = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max                                = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen                         = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom                         = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft                           = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile                               = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop                            = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral                             = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle                            = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw                           = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne                           = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw                           = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse                           = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon                              = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme                                = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
