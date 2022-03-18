#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
alias 🐴='cal'
alias ssh="kitty +kitten ssh"
alias windows='cd /mnt/ee75131c-0506-4766-8e7a-45c015260622/emulators/quickgui-1.1.1/ && quickemu --display spice --vm windows-10.conf'
alias jb='sudo /mnt/ee75131c-0506-4766-8e7a-45c015260622/iPhones/JBs/checkra1n'
alias ls='ls --color=auto'
alias edithitman='cd /mnt/ee75131c-0506-4766-8e7a-45c015260622/SteamLibrary/steamapps/compatdata/863550/pfx && wine64 regedit'
alias tablet='scrcpy -s 0123456789ABCDEF'
alias shares='./sharescreen'
alias ah='sudo /mnt/ee75131c-0506-4766-8e7a-45c015260622/ah/ah'
alias pass='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c64 && echo ""'
alias ass='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16 && echo ""'
alias saveme='setxkbmap fi,fi'
asignapp() {
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /mnt/ee75131c-0506-4766-8e7a-45c015260622/ntfy-android/keys/sauna.keystore $1 the-sauna.icu
}
alias signapp='jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /mnt/ee75131c-0506-4766-8e7a-45c015260622/ntfy-android/keys/sauna.ks /mnt/ee75131c-0506-4766-8e7a-45c015260622/ntfy-android/app/build/outputs/apk/play/release/app-play-release-unsigned.apk the-sauna.icu'
PS1='\[\e[0;2m\]\T\[\e[0;2m\]|\[\e[0;2m\]\d\[\e[0;2m\](\[\e[0m\]\w\[\e[0;2m\])\[\e[0m\]~\[\e[0;1m\]\$\[\e[0m\] \[\e[0m\]'
export LC_ALL="en_US.UTF-8"
export PATH="$PATH:/home/koutsie/bin:/home/koutsie/.local/share/gem/ruby/3.0.0/bin:/opt/android-sdk/tools/bin"
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
export ANDROID_SDK_ROOT=/opt/android-sdk
export VISUAL=nano


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
