<img src="https://i.ibb.co/jGMg3Ym/bootifull.png" />


# dotfilez

Updated dotfiles this time with i3, sowm etc



## install:
Install deps:

```yay -S flameshot pamixer wget curl mps-youtube dunst git feh imlib2 sed```

Install dotfilez:

```curl -fsSL https://git.io/Je6fO | bash```


### Notes:

> Brightness controls have been configured for an amdgpu laptop, please make sure to change those to match your own solution.


> Volume changing uses `pamixer` and only changes the current output, please make sure to edit as needed.


> Wallpaper changer uses unsplash's url api, please make sure to change it to your liking (currently: `nature` is used.).


## Depencies/Configured programs so far:
- flameshot
- pamixer
- wget
- curl
- mpsyt (mps-youtube)
- dunst
- git
- sowm
- feh
- imlib2
- xfce4-terminal
- sed
- screen


Wich you can easily install with *yay*: 

```yay -S flameshot pamixer wget curl mps-youtube dunst git feh imlib2 sed```


## Default Layout
![Layout](./docs/dotfilez-layout.jpg)


*NOTE: default modifier is __Super__*



**Window Management**

| combo                      | action                 |
| -------------------------- | -----------------------|
| `Mouse`                    | focus under cursor     |
| `MOD4` + `Left Mouse`      | move window            |
| `MOD4` + `Right Mouse`     | resize window          |
| `MOD4` + `f`               | maximize toggle        |
| `MOD4` + `c`               | center window          |
| `MOD4` + `q`               | kill window            |
| `MOD4` + `1-9`             | desktop swap           |
| `MOD4` + `Shift` +`1-9`    | send window to desktop |
| `MOD1` + `TAB` (*alt-tab*) | focus cycle            |

------

**Shortcuts**

| combo                      | action                 |
| -------------------------- | -----------------------|
| `MOD4` + `p`                    | flameshot screenshot tool |
| `MOD4` + `m`      | mpsyt            |
| `MOD4` + `XF86_MonBrightnessUp`     | brightness up          |
| `MOD4` + `XF86_MonBrightnessDown`               | brightness down        |
| `MOD4` + `XF86_AudioRaiseVolume`               | volume up          |
| `MOD4` + `XF86_AudioLowerVolume`               | volume down            |
| `MOD4` + `w`             | get a new random wallpaper           |
| `MOD4` + `z`    | save current wallpaper to favourites |
| `MOD4` + `x` | get a random wallpaper from favourites            |



## Editors:
For nano: https://github.com/scopatz/nanorc

For geany: `tango light` with `sourcecode variable bold`

------

wanna donate?

[![donate3.th.png](https://s5.gifyu.com/images/donate3.th.png)](https://gifyu.com/image/vI0f)

eth: *`?0x02a17dbf3d15962150e4efe8f74e2491d733629f`*
