#ifndef CONFIG_H
#define CONFIG_H

#define MOD Mod4Mask

const char* menu[]    = {"/home/koutsie/Scripts/dmenu.sh", 0};
const char* music[]   = {"/home/koutsie/Scripts/mpsyt.sh", 0};
const char* term[]    = {"xfce4-terminal", 0};
const char* screenshot[]   = {"/home/koutsie/Scripts/screenshot.sh", 0};
const char* briup[]   = {"/home/koutsie/Scripts/b_up.sh", 0};
const char* bridown[] = {"/home/koutsie/Scripts/b_down.sh" , 0};
const char* vold[] = {"/home/koutsie/Scripts/vol_down.sh", 0};
const char* volp[]   = {"/home/koutsie/Scripts/vol_up.sh", 0};
const char* colors[]  = {"/home/koutsie/Scripts/wallpaper.sh", 0};
const char* favw[]    = {"/home/koutsie/Scripts/fav_wall.sh", 0};
const char* restorew[]    = {"/home/koutsie/Scripts/getwall.sh", 0};


static struct key keys[] = {
    {MOD,      XK_q,   win_kill,   {0}},
    {MOD,      XK_c,   win_center, {0}},
    {MOD,      XK_f,   win_fs,     {0}},
    {Mod1Mask, XK_Tab, win_next,   {0}},

// Added: mpsyt hotkey
    {MOD, XK_m,      run, {.com = music}},


// Added: dmenu#2 hotkey

    {0, XK_Control_R,      run, {.com = menu}},

    {MOD, XK_d,      run, {.com = menu}},
    {MOD, XK_w,      run, {.com = colors}},
    {MOD, XK_p,      run, {.com = screenshot}},
    {MOD, XK_Return, run, {.com = term}},


// Added: favourite wallpaper key | Added: get local wallpaper

    {MOD, XK_z, run, {.com = favw}},
    {MOD, XK_x, run, {.com = restorew}},

    {0,   XF86XK_AudioRaiseVolume,  run, {.com = volp}},
    {0,   XF86XK_AudioLowerVolume,  run, {.com = vold}},


    {0,   XF86XK_MonBrightnessUp,  run, {.com = briup}},
    {0,   XF86XK_MonBrightnessDown, run, {.com = bridown}},

    {MOD,           XK_1, ws_go,     {.i = 1}},
    {MOD|ShiftMask, XK_1, win_to_ws, {.i = 1}},
    {MOD,           XK_2, ws_go,     {.i = 2}},
    {MOD|ShiftMask, XK_2, win_to_ws, {.i = 2}},
    {MOD,           XK_3, ws_go,     {.i = 3}},
    {MOD|ShiftMask, XK_3, win_to_ws, {.i = 3}},
    {MOD,           XK_4, ws_go,     {.i = 4}},
    {MOD|ShiftMask, XK_4, win_to_ws, {.i = 4}},
    {MOD,           XK_5, ws_go,     {.i = 5}},
    {MOD|ShiftMask, XK_5, win_to_ws, {.i = 5}},
    {MOD,           XK_6, ws_go,     {.i = 6}},
    {MOD|ShiftMask, XK_6, win_to_ws, {.i = 6}},
};

#endif
