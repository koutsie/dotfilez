import os 
import re 
import socket 
import subprocess 
from libqtile.config import Drag, Key, Screen, Group, Drag, Click, Rule 
from libqtile.command import lazy, Client 
from libqtile import layout, bar, widget, hook 
from libqtile.widget import Spacer 
import arcomemory 

mod = "mod4"
mod1 = "alt"
mod2 = "control"
home = os.path.expanduser('~')


@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

keys = [
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "KP_Enter", lazy.spawn('termite')),
    Key([mod], "Return", lazy.spawn('termite')),
    Key([mod, "shift"], "Return", lazy.spawn('thunar')),
    Key([mod], "d", lazy.spawn('dmenu_run')),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "control"], "r", lazy.restart()),
    Key(["mod1", "control"], "Return", lazy.spawn('termite')),
    Key([], "Print", lazy.spawn("flameshot gui")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("exec /home/$USER/Scripts/b_up.sh")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("exec /home/$USER/Scripts/b_down.sh")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    Key([mod, "shift"], "f", lazy.layout.flip()),
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),]

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0",]
group_labels = ["[1] ", "[2] ", "[3] ", "[4] ", "[5] ", "[6] ", "[7] ", "[8] ", "[9] ", "[0]",]
group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall",]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([

        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key(["mod1"], "Tab", lazy.screen.next_group()),
        Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),

        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])


def init_layout_theme():
    return {"margin":12,
            "border_width":4,
            "border_focus": "#691E00",
            "border_normal": "#91000E"	
            }

layout_theme = init_layout_theme()


layouts = [
    layout.MonadTall(margin=8, border_width=2, border_focus="#E02436", border_normal="#691E00"),
    layout.MonadWide(margin=8, border_width=2, border_focus="#E02436", border_normal="#691E00"),
    layout.Matrix(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme)
]

def init_colors():
    return [["#2F343F", "#2F343F"], # color 0
            ["#2F343F", "#2F343F"], # color 1
            ["#c0c5ce", "#c0c5ce"], # color 2
            ["#fba922", "#fba922"], # color 3
            ["#3384d0", "#3384d0"], # color 4
            ["#f3f4f5", "#f3f4f5"], # color 5
            ["#cd1f3f", "#cd1f3f"], # color 6
            ["#62FF00", "#62FF00"], # color 7
            ["#6790eb", "#6790eb"], # color 8
            ["#a9a9a9", "#a9a9a9"]] # color 9
colors = init_colors()

def init_widgets_defaults():
    return dict(font="Hack",
                fontsize = 12,
                padding = 6,
                background=colors[1])

widget_defaults = init_widgets_defaults()

def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [
               widget.GroupBox(font="Hack Bold",
                        fontsize = 10,
                        margin_y = -1,
                        margin_x = 0,
                        padding_y = 8,
                        padding_x = 5,
                        borderwidth = 2,
                        disable_drag = True,
                        active = colors[9],
                        inactive = colors[5],
                        rounded = False,
                        highlight_method = "text",
                        this_current_screen_border = colors[6],
                        foreground = colors[2],
                        background = colors[1]
                        ),
               widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[2],
                        background = colors[1]
                        ),
               widget.CurrentLayout(
                        font = "Hack",
                        foreground = colors[5],
                        background = colors[1]
                        ),
               widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[2],
                        background = colors[1]
                        ),
               widget.WindowName(font="Hack Bold",
                        fontsize = 12,
                        foreground = colors[5],
                        background = colors[1],
                        ),
               widget.Clock(
                        foreground = colors[5],
                        background = colors[1],
                        fontsize = 12,
                        format="%Y-%m-%d %H:%M"
                        ),
               widget.Sep(
                         linewidth = 1,
                         padding = 10,
                         foreground = colors[2],
                         background = colors[1]
                         ),
               widget.TextBox(
                        font="Hack",
                        text=" CPU: ",
                        foreground=colors[6],
                        background=colors[1],
                        padding = 0,
                        fontsize=16
                        ),
               widget.CPUGraph(
                        border_color = colors[2],
                        fill_color = colors[8],
                        graph_color = colors[8],
                        background=colors[1],
                        border_width = 1,
                        line_width = 1,
                        core = "all",
                        type = "box"
                        ),
               widget.ThermalSensor(
						font="Hack",
                        foreground = colors[5],
                        foreground_alert = colors[6],
                        background = colors[1],
                        metric = True,
                        padding = 3,
                        threshold = 80
                        ),
               widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[2],
                        background = colors[1]
                        ),
               widget.TextBox(
                        font="Hack Bold",
                        text=" RAM: ",
                        foreground=colors[4],
                        background=colors[1],
                        padding = 0,
                        fontsize=16
                        ),
               arcomemory.Memory(
                        font="Hack-Bold",
                        fmt = '{MemUsed}/{MemTotal}M',
                        update_interval = 10,
                        fontsize = 12,
                        foreground = colors[5],
                        background = colors[1],
                        ),
               widget.Sep(
                         linewidth = 1,
                         padding = 10,
                         foreground = colors[2],
                         background = colors[1]
                         ),
               widget.Systray(
                        background=colors[1],
                        icon_size=20,
                        padding = 4
                        ),
              ]
    return widgets_list

widgets_list = init_widgets_list()

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2

widgets_screen1 = init_widgets_screen1()
widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=26)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=26))]
screens = init_screens()

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])

@hook.subscribe.startup
def start_always():
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},
    {'wmclass': 'makebranch'},
    {'wmclass': 'maketag'},
    {'wmclass': 'Arandr'},
    {'wmclass': 'feh'},
    {'wmclass': 'Galculator'},
    {'wmclass': 'Oblogout'},
    {'wmclass': 'xfce4-terminal'},
    {'wname': 'branchdialog'},
    {'wname': 'Open File'},
    {'wname': 'pinentry'},
    {'wmclass': 'ssh-askpass'},

],  fullscreen_border_width = 0, border_width = 0)
auto_fullscreen = True

focus_on_window_activation = "focus"

wmname = "LG3D+"
