// Edited version of "config.def.h" for sowm


#ifndef CONFIG_H
#define CONFIG_H

#define MOD Mod4Mask

const char* menu[]    = {"dmenu_run", 0};
const char* music[]   = {"/home/koutsie/Scripts/mpsyt.sh", 0};
const char* term[]    = {"xfce4-terminal", 0};
const char* scrot[]   = {"/home/koutsie/Scripts/screenshot.sh", 0};
const char* briup[]   = {"/home/koutsie/Scripts/b_up.sh", 0};
const char* bridown[] = {"/home/koutsie/Scripts/b_down.sh" , 0};
const char* voldown[] = {"/home_koutsie/Scripts/vol_down.sh", 0};
const char* volup[]   = {"/home/koutsie/Scripts/vol_up.sh", 0};
const char* colors[]  = {"/home/koutsie/Scripts/wallpaper.sh", 0};

static struct key keys[] = {
    {MOD,      XK_q,   win_kill,   {0}},
    {MOD,      XK_c,   win_center, {0}},
    {MOD,      XK_f,   win_fs,     {0}},
    {Mod1Mask, XK_Tab, win_next,   {0}},

// Added: mpsyt hotkey
    {MOD, XK_m,      run, {.com = music}},


// Added: dmenu#2 hotkey
    {MOD, XK_Control_R,      run, {.com = menu}},

    {MOD, XK_d,      run, {.com = menu}},
    {MOD, XK_w,      run, {.com = colors}},
    {MOD, XK_p,      run, {.com = scrot}},
    {MOD, XK_Return, run, {.com = term}},

// Added: so my F2(AudioLowerVolume) is doing odd stuff so i made the F1(XF86AudioMute) my AudioLowerVolume key
    {0,   XF86XK_AudioMute,         run, {.com = voldown}},
    {0,   XF86XK_AudioLowerVolume,  run, {.com = voldown}},
    {0,   XF86XK_AudioRaiseVolume,  run, {.com = volup}},

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
