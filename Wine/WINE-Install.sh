#!/bin/bash
#
# Written by Jeffrey Scott Flesher
# Date: 8 Sep 2022
#
# real	27m30.544s
# user	8m53.086s
# sys	6m16.021s
#
# WINE: Windows Integration No Emumlation
# Run in termimal in Linux, change direction to avoid long absolote paths
# cd ~/Scripts/
# time ~/Scripts/WINE-Install.sh
# time ~/Scripts/WINE-Install.sh &> ~/Scripts/WINE-log.combined.txt
# time ./WINE-Install.sh 2> WINE-log.error.txt 1> WINE-log.output.txt
# ? is becasue shell check fill fail, remove it before you run it.
# shell?check -x ~/Scripts/WINE-Install.sh
#
#
stat /dev/ttyS0;
echo "";echo "";echo "";echo "";echo "";echo "";
clear;
# shellcheck disable=SC1091
# shellcheck disable=SC1090
[[ -f ~/.bash_aliaeses ]] && source ~/.bash_aliaeses;
# shellcheck disable=SC1091
# shellcheck disable=SC1090
[[ -f ~/.profile ]] && source ~/.profile;
#
set -u; # same as  set -o nounset, error if variable is not set
# nocaseglob: If set, Bash matches filenames in a case-insensitive fashion when performing filename expansion.
# dotglob: If set, Bash includes filenames beginning with a `.' in the results of filename expansion.
# -s   Enable (set) each optname
shopt -s nullglob dotglob;
IFS=$' '; # IFS=$'\n\t'; IFS=$'\n';
# User's file creation mask. umask sets an environment variable which automatically sets file permissions on newly created files.
# i.e. it will set the shell process's file creation mask to mode.
umask 022;
unalias -a; # -a   Remove All aliases; so cp is not cp -i
# -f The names refer to shell Functions, and the function definition is removed.
# Readonly variables and functions may not be unset
unset -f "$(declare -F | sed "s/^declare -f //")";
#
#trap "echo Exited!; exit;" SIGINT SIGTERM;
trap "echo install-home Control Break; exit;"     SIGINT;
trap "echo install-home SIGTERM-d; exit;"         SIGTERM;
trap "echo install-home Exited with Error; exit;" EXIT;
trap "echo install-home Finished normally; exit;" 0;
declare Red;    Red=$'\e[1;31m';
declare Green;  Green=$'\e[1;32m';
declare Blue;   Blue=$'\e[1;34m';
declare Yellow; Yellow=$'\e[1;33m';
declare Reset;  Reset=$'\e[0m';
# ##########################################################################
# https://man.archlinux.org/man/multilib/winetricks/winetricks.1.en
# winetricks --help
echo "$Red Required to use sudo to run sudo winetricks --self-update $Reset";
# gksu winetricks --self-update
sudo winetricks --self-update -y && sudo winetricks --self-update;
# COMMANDS
# winetricks apps list # list verbs in category 'applications'
#   3m_library               3M Cloud Library (3M Company, 2015) [downloadable]
#   7zip                     7-Zip 19.00 (Igor Pavlov, 2019) [downloadable,cached]
#   adobe_diged4             Adobe Digital Editions 4.5 (Adobe, 2015) [downloadable]
#   adobe_diged              Adobe Digital Editions 1.7 (Adobe, 2011) [downloadable]
#   autohotkey               AutoHotKey (autohotkey.org, 2010) [downloadable,cached]
# winetricks benchmarks list # list verbs in category 'benchmarks'
#   3dmark03                 3D Mark 03 (Futuremark, 2003) 
# winetricks dlls list #  list verbs in category 'dlls'
#   allcodecs                All codecs (dirac, ffdshow, icodecs, cinepak, l3codecx, xvid) except wmp (various, 1995-2009) [downloadable]
#   amstream                 MS amstream.dll (Microsoft, 2011) [downloadable,cached]
#   art2k7min                MS Access 2007 runtime (Microsoft, 2007) [downloadable,cached]
# winetricks games list # list verbs in category 'games'
#   acreedbro                Assassin's Creed Brotherhood (Ubisoft, 2011) 
#   algodoo_demo             Algodoo Demo (Algoryx, 2009) [downloadable]
#   amnesia_tdd_demo         Amnesia: The Dark Descent Demo (Frictional Games, 2010) 
# winetricks fonts list # list verbs in category 'fonts'
#   allfonts                 All fonts (various, 1998-2010) [downloadable]
#   andale                   MS Andale Mono font (Microsoft, 2008) [downloadable]
#   arial                    MS Arial / Arial Black fonts (Microsoft, 2008) [downloadable]
# winetricks settings list # list verbs in category 'settings'
# alldlls=builtin          Override most common DLLs to builtin 
# alldlls=default          Remove all DLL overrides 
# autostart_winedbg=disabled Prevent winedbg from launching when an unhandled exception occurs 
# autostart_winedbg=enabled Automatically launch winedbg when an unhandled exception occurs (default) 
# bad                      Fake verb that always returns false 
# cfc=disabled             Disable CheckFloatConstants (default) 
# cfc=enabled              Enable CheckFloatConstants 
# csmt=force               Enable and force serialisation of OpenGL or Vulkan commands between multiple command streams in the same application 
# csmt=off                 Disable Command Stream Multithreading 
# csmt=on                  Enable Command Stream Multithreading (default) 
# fontfix                  Check for broken fonts 
# fontsmooth=bgr           Enable subpixel font smoothing for BGR LCDs 
# fontsmooth=disable       Disable font smoothing 
# fontsmooth=gray          Enable subpixel font smoothing 
# fontsmooth=rgb           Enable subpixel font smoothing for RGB LCDs 
# forcemono                Force using Mono instead of .NET (for debugging) 
# good                     Fake verb that always returns true 
# grabfullscreen=n         Disable cursor clipping for full-screen windows (default) 
# grabfullscreen=y         Force cursor clipping for full-screen windows (needed by some games) 
# gsm=0                    Set MaxShaderModelGS to 0 
# gsm=1                    Set MaxShaderModelGS to 1 
# gsm=2                    Set MaxShaderModelGS to 2 
# gsm=3                    Set MaxShaderModelGS to 3 
# heapcheck                Enable heap checking with GlobalFlag 
# hidewineexports=disable  Disable hiding Wine exports from applications (wine-staging) 
# hidewineexports=enable   Enable hiding Wine exports from applications (wine-staging) 
# hosts                    Add empty C:\windows\system32\drivers\etc\{hosts,services} files 
# isolate_home             Remove wineprefix links to ~ 
# macdriver=mac            Enable the Mac native Quartz driver (default) 
# macdriver=x11            Disable the Mac native Quartz driver, use X11 instead 
# mackeyremap=both         Enable mapping opt->alt and cmd->ctrl keys for the Mac native driver 
# mackeyremap=left         Enable mapping of left opt->alt and cmd->ctrl keys for the Mac native driver 
# mackeyremap=none         Do not remap keys for the Mac native driver (default) 
# mimeassoc=off            Disable exporting MIME-type file associations to the native desktop 
# mimeassoc=on             Enable exporting MIME-type file associations to the native desktop (default) 
# mwo=disable              Set DirectInput MouseWarpOverride to disable 
# mwo=enabled              Set DirectInput MouseWarpOverride to enabled (default) 
# mwo=force                Set DirectInput MouseWarpOverride to force (needed by some games) 
# native_mdac              Override odbc32, odbccp32 and oledb32 
# native_oleaut32          Override oleaut32 
# nocrashdialog            Disable crash dialog 
# npm=repack               Set NonPower2Mode to repack 
# nt351                    Set Windows version to Windows NT 3.51 
# nt40                     Set Windows version to Windows NT 4.0 
# orm=backbuffer           Set OffscreenRenderingMode=backbuffer 
# orm=fbo                  Set OffscreenRenderingMode=fbo (default) 
# psm=0                    Set MaxShaderModelPS to 0 
# psm=1                    Set MaxShaderModelPS to 1 
# psm=2                    Set MaxShaderModelPS to 2 
# psm=3                    Set MaxShaderModelPS to 3 
# remove_mono              Remove builtin wine-mono 
# renderer=gdi             Set renderer to gdi 
# renderer=gl              Set renderer to gl 
# renderer=no3d            Set renderer to no3d 
# renderer=vulkan          Set renderer to vulkan 
# rtlm=auto                Set RenderTargetLockMode to auto (default) 
# rtlm=disabled            Set RenderTargetLockMode to disabled 
# rtlm=readdraw            Set RenderTargetLockMode to readdraw 
# rtlm=readtex             Set RenderTargetLockMode to readtex 
# rtlm=texdraw             Set RenderTargetLockMode to texdraw 
# rtlm=textex              Set RenderTargetLockMode to textex 
# sandbox                  Sandbox the wineprefix - remove links to ~ 
# set_mididevice           Set MIDImap device to the value specified in the MIDI_DEVICE environment variable 
# set_userpath             set user PATH variable in wine prefix specified by native and/or wine paths in WINEPATH environment variable with ';' as path separator 
# shader_backend=arb       Set shader_backend to arb 
# shader_backend=glsl      Set shader_backend to glsl 
# shader_backend=none      Set shader_backend to none 
# sound=alsa               Set sound driver to ALSA 
# sound=coreaudio          Set sound driver to Mac CoreAudio 
# sound=disabled           Set sound driver to disabled 
# sound=oss                Set sound driver to OSS 
# sound=pulse              Set sound driver to PulseAudio 
# ssm=disabled             Disable Struct Shader Math (default) 
# ssm=enabled              Enable Struct Shader Math 
# usetakefocus=n           Disable UseTakeFocus (default) 
# usetakefocus=y           Enable UseTakeFocus 
# vd=1024x768              Enable virtual desktop, set size to 1024x768 
# vd=1280x1024             Enable virtual desktop, set size to 1280x1024 
# vd=1440x900              Enable virtual desktop, set size to 1440x900 
# vd=640x480               Enable virtual desktop, set size to 640x480 
# vd=800x600               Enable virtual desktop, set size to 800x600 
# vd=off                   Disable virtual desktop 
# videomemorysize=1024     Tell Wine your video card has 1024MB RAM 
# videomemorysize=2048     Tell Wine your video card has 2048MB RAM 
# videomemorysize=512      Tell Wine your video card has 512MB RAM 
# videomemorysize=default  Let Wine detect amount of video card memory 
# vista                    Set Windows version to Windows Vista 
# vsm=0                    Set MaxShaderModelVS to 0 
# vsm=1                    Set MaxShaderModelVS to 1 
# vsm=2                    Set MaxShaderModelVS to 2 
# vsm=3                    Set MaxShaderModelVS to 3 
# win10                    Set Windows version to Windows 10 
# win20                    Set Windows version to Windows 2.0 
# win2k3                   Set Windows version to Windows 2003 
# win2k8r2                 Set Windows version to Windows 2008 R2 
# win2k8                   Set Windows version to Windows 2008 
# win2k                    Set Windows version to Windows 2000 
# win30                    Set Windows version to Windows 3.0 
# win31                    Set Windows version to Windows 3.1 
# win7                     Set Windows version to Windows 7 
# win81                    Set Windows version to Windows 8.1 
# win8                     Set Windows version to Windows 8 
# win95                    Set Windows version to Windows 95 
# win98                    Set Windows version to Windows 98 
# windowmanagerdecorated=n Prevent the window manager from decorating windows 
# windowmanagerdecorated=y Allow the window manager to decorate windows (default) 
# windowmanagermanaged=n   Prevent the window manager from controlling windows 
# windowmanagermanaged=y   Allow the window manager to control windows (default) 
# winme                    Set Windows version to Windows ME 
# winver=                  Set Windows version to default (win7) 
# winxp                    Set Windows version to Windows XP 
# winetricks list # list categories
#   apps benchmarks dlls fonts games settings
# winetricks list-cached # list cached-and-ready-to-install verbs
#   7zip
#   amstream
#   art2k7min
# winetricks list-download # list verbs which download automatically
#   3dmark05
#   7zip
#   adobe_diged
#   allcodecs
#   allfonts
# winetricks list-manual-download # list verbs which download with some help from the user
#   3dmark03
#   amnesia_tdd_demo
#   avatar_demo
#   blobby_volley
# winetricks list-installed # list already-installed verbs
#   w_workaround_wine_bug-34803
#   remove_mono
#   winxp
#   vcrun2008
#   dotnet40
# winetricks arch=32|64 # create wineprefix with 32 or 64 bit, this option must be given before prefix=foobar and will not work in case of the default wineprefix.
#   
# winetricks prefix=foobar # select WINEPREFIX=$HOME/.local/share/wineprefixes/foobar
#   
# winetricks annihilate # Delete ALL DATA AND APPLICATIONS INSIDE THIS WINEPREFIX 
#   
# ENVIRONMENT VARIABLES
# Wine checks several environment variables on startup:
# WINE           # If set, this specifies which wine binary to use by default
# WINESERVER     # If set, this specifies which wineserver to use by default
# WINEPREFIX     # If set, this specifies the location of the default .wine directory ( usually $HOME/.wine ).
# XDG_CACHE_HOME # If set, this is path to system's user data cache (default: $HOME/.cache) W_CACHE path to Winetricks' user data cache (default: $XDG_CACHE_HOME/winetricks} 
# ##########################################################################
# This is an unattended terminal script to install WINE dlls using winetricks.
# I could not get win10 working, it needs beyound wmp11 so I am using win7.
# This is both Win32 in folder ~/.win32 and Win64 in folder ~/win64, but not a full install since x64 is limited
#   win10        # Windows 10 
#   win81        # Windows 8.1 
#   win8         # Windows 8 
#   win7         # Windows 7 
#   winver=      # default (win7) 
#   vista        # Windows Vista 
#   winxp        # Windows XP 
#   winme        # Windows ME 
#   win2k3       # Windows 2003 
#   win2k8r2     # Windows 2008 R2 
#   win2k8       # Windows 2008 
#   win2k        # Windows 2000 
#   nt40         # Windows NT 4.0 
#   nt351        # Windows NT 3.51 
#   win98        # Windows 98 
#   win95        # Windows 95 
#   win31        # Windows 3.1 
#   win30        # Windows 3.0 
#   win20        # Windows 2.0 
#
# Start Time
declare -x TimeStart; TimeStart="$(date +"%s.%N")";
# *****************************************************************************
echo "$Red Warning!!! This will delete all WINE Windows installations in ~/.win32 $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended annihilate; # Delete ALL DATA AND APPLICATIONS INSIDE THIS WINEPREFIX 
# Delete folders if they exist and recreate the folders
# x32
if [ -d ~/.win32 ]; then rm -rf ~/.win32; fi
# mkdir -p ~/.win32;
export WINEARCH=win32
export WINEPREFIX=~/.win32
export WINESERVER=/usr/bin/wineserver
declare -gx LD_LIBRARY_PATH;
if [ -z ${LD_LIBRARY_PATH+x} ]; then LD_LIBRARY_PATH=""; else echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"; fi
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/:/usr/local/lib;
# env WINEPREFIX=~/.win32 wineboot -u
# install win7 x32
echo "$Yellow  kill wineserver $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k;
echo "$Yellow  set arch=32 $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended arch=32;
echo "$Yellow  winecfg Windows $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 wine winecfg -v win7;
echo "$Yellow  Reboot $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u;
echo "$Yellow  Install Windows 7 $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended win7;
# Kill Wine Server
# Reboot
echo "$Yellow  Rebooting WINE.................................................. $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
#
echo "$Green  Installing Gecko x32..................................... $Reset";
if [ ! -f wine-gecko-2.47.2-x86.msi ]; then wget http://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86.msi; fi
WINEARCH=win32 WINEPREFIX=~/.win32 wine msiexec /i wine-gecko-2.47.2-x86.msi
#
# if [ ! -f wine-gecko-2.47.2-x86_64.msi ]; then wget http://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86_64.msi; fi
# WINEARCH=win32 WINEPREFIX=~/.win32 wine msiexec /i wine-gecko-2.47.2-x86_64.msi

# Note: The order these get executed needs to be optimized, you might find some are installed before being called
# Quartz A.K.A. DirectShow
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended quartz_feb2010; # quartz.dll (February 2010) (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended quartz;       # quartz.dll (Microsoft, 2011) [downloadable,cached]
# warning: You can specify individual DirectShow verbs instead. e.g. 'winetricks quartz'
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended directshow; # DirectShow runtime DLLs (amstream, qasf, qcap, qdvd, qedit, quartz) (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended amstream;   # MS amstream.dll (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended qasf;       # qasf.dll (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended qcap;       # qcap.dll (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended qdvd;       # qdvd.dll (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended qedit;      # qedit.dll (Microsoft, 2011) [downloadable,cached]
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended autohotkey;     # AutoHotKey (autohotkey.org, 2010) [downloadable]
# MS misc dlls
echo "$Green MS misc dlls...................................................... $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msaa;     # MS Active Accessibility (oleacc.dll, oleaccrc.dll, msaatext.dll) (Microsoft, 2003) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msacm32;  # MS ACM32 (Microsoft, 2003) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msasn1;   # MS ASN1 (Microsoft, 2003) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msctf;    # MS Text Service Module (Microsoft, 2003) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msdelta;  # MSDelta differential compression library (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msdxmocx; # MS Windows Media Player 2 ActiveX control for VB6 (Microsoft, 1999) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msflxgrd; # MS FlexGrid Control (msflxgrd.ocx) (Microsoft, 2012) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msftedit; # Microsoft RichEdit Control (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mshflxgd; # MS Hierarchical FlexGrid Control (mshflxgd.ocx) (Microsoft, 2012) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msls31;   # MS Line Services (Microsoft, 2001) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msmask;   # MS Masked Edit Control (Microsoft, 2009) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mspatcha; # MS mspatcha (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msscript; # MS Windows Script Control (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msvcirt;  # Visual C++ 6 SP4 msvcirt library; part of vcrun6 (Microsoft, 2000) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msvcrt40; # fixme (Microsoft, 2011) [downloadable,cached]
# MS XML
echo "$Green MS XML............................................................ $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msxml3;   # MS XML Core Services 3.0 (Microsoft, 2005) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msxml4;   # MS XML Core Services 4.0 (Microsoft, 2009) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended msxml6;   # MS XML Core Services 6.0 sp2 (Microsoft, 2009) [downloadable,cached]
# MFC
echo "$Green MS MFC............................................................ $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mf;     # MS Media Foundation (Microsoft, 2011) [downloadable,cached]
# Not sure which one to install
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc40;  # MS mfc40 (Microsoft Foundation Classes from win7sp1) (Microsoft, 1999) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc42;  # Visual C++ 6 SP4 mfc42 library; part of vcrun6 (Microsoft, 2000) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc70;  # Visual Studio (.NET) 2002 mfc70 library (Microsoft, 2006) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc71;  # Visual C++ 2003 mfc71 library; part of vcrun2003 (Microsoft, 2003) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc80;  # Visual C++ 2005 mfc80 library; part of vcrun2005 (Microsoft, 2011) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc80;  # Visual C++ 2005 mfc80 library; part of vcrun2005 (Microsoft, 2011) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc90;  # Visual C++ 2008 mfc90 library; part of vcrun2008 (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc100; # Visual C++ 2010 mfc100 library; part of vcrun2010 (Microsoft, 2010) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc110; # Visual C++ 2012 mfc110 library; part of vcrun2012 (Microsoft, 2012) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc120; # Visual C++ 2013 mfc120 library; part of vcrun2013 (Microsoft, 2013) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mfc140; # Visual C++ 2015 mfc140 library; part of vcrun2015 (Microsoft, 2015) [downloadable,cached]
# Reboot
echo "$Yellow  Rebooting WINE.................................................. $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# Dot Net
echo "$Green Dot Net........................................................... $Reset";
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet11sp1;        # MS .NET 1.1 SP1 (Microsoft, 2004) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet11;           # MS .NET 1.1 (Microsoft, 2003) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet20sp1;        # MS .NET 2.0 SP1 (Microsoft, 2008) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet20sp2;        # MS .NET 2.0 SP2 (Microsoft, 2009) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet20;           # MS .NET 2.0 (Microsoft, 2006) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet30sp1;        # MS .NET 3.0 SP1 (Microsoft, 2007) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet30;           # MS .NET 3.0 (Microsoft, 2006) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet35sp1;        # MS .NET 3.5 SP1 (Microsoft, 2008) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet35;           # MS .NET 3.5 (Microsoft, 2007) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet40_kb2468871; # MS .NET 4.0 KB2468871 (Microsoft, 2011) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet40;           # MS .NET 4.0 (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet452;          # MS .NET 4.5.2 (Microsoft, 2012) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet45;           # MS .NET 4.5 (Microsoft, 2012) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet461;          # MS .NET 4.6.1 (Microsoft, 2015) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet462;          # MS .NET 4.6.2 (Microsoft, 2016) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet46;           # MS .NET 4.6 (Microsoft, 2015) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet471;          # MS .NET 4.7.1 (Microsoft, 2017) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet472;            # MS .NET 4.7.2 (Microsoft, 2018) [downloadable] does not work in wine fully: fails dotnet48; installs all previous versoins it can
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet48;           # MS .NET 4.8 (Microsoft, 2019) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnetcore2;        # MS .NET Core Runtime 2.1 LTS (Microsoft, 2020) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnetcore3;        # MS .NET Core Runtime 3.1 LTS (Microsoft, 2020) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnetcoredesktop3; # MS .NET Core Desktop Runtime 3.1 LTS (Microsoft, 2020) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dotnet_verifier;    # MS .NET Verifier (Microsoft, 2016) [downloadable]
# restart later
echo "$Yellow  Rebooting WINE.................................................. $Reset";
# Required
echo "$Green Required.......................................................... $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended wsh57;         # MS Windows Script Host 5.7 (Microsoft, 2007) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended gdiplus;       # MS GDI+ (Microsoft, 2011) [downloadable,cached]
#                                                         gdiplus_winxp; # MS GDI+ (Microsoft, 2009) [cached]
# Direct X
echo "$Green Direct X.......................................................... $Reset";
# setup_vkd3d_proton
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0054; # Vulkan-based D3D11 implementation for Linux / Wine (0.54) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0060; # Vulkan-based D3D11 implementation for Linux / Wine (0.60) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0061; # Vulkan-based D3D11 implementation for Linux / Wine (0.61) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0062; # Vulkan-based D3D11 implementation for Linux / Wine (0.62) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0063; # Vulkan-based D3D11 implementation for Linux / Wine (0.63) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0064; # Vulkan-based D3D11 implementation for Linux / Wine (0.64) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0065; # Vulkan-based D3D11 implementation for Linux / Wine (0.65) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0070; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.70) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0071; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.71) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0072; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.72) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0080; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.80) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0081; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.81) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0090; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.90) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0091; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.91) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0092; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.92) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0093; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.93) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0094; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.94) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0095; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.95) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk0096; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (0.96) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1000; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1001; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1002; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1003; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.0.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1011; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.1.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1020; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1021; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1022; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1023; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.2.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1030; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1031; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1032; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1033; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1034; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.3.4) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1040; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1041; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1042; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1043; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1044; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.4) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1045; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.5) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1046; # Vulkan-based D3D10/D3D11 implementation for Linux / Wine (1.4.6) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1050; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1051; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1052; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1053; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1054; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.4) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1055; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.5.5) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1060; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.6) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1061; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.6.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1070; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1071; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1072; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1073; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.7.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1080; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.8) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1081; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.8.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1090; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1091; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1092; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1093; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.3) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1094; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.9.4) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1100; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1101; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10.1) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1102; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10.2) (Philip Rebohle, 2017) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk1103; # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (1.10.3) (Philip Rebohle, 2017) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxvk;       # Vulkan-based D3D9/D3D10/D3D11 implementation for Linux / Wine (latest) (Philip Rebohle, 2017) [downloadable] setup_dxvk
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vkd3d;      # Vulkan-based D3D12 implementation for Linux / Wine (latest) (Hans-Kristian Arntzen , 2020) [downloadable]
# Direct X SDK
# only install one if needed
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxsdk_aug2006;
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxsdk_jun2010; 
# Direct X Complirer
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dcompiler_42; # MS d3dcompiler_42.dll (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dcompiler_43;   # MS d3dcompiler_43.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dcompiler_46; # MS d3dcompiler_46.dll (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dcompiler_47;   # MS d3dcompiler_47.dll (Microsoft, FIXME) [downloadable,cached]
# Direct X 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended directmusic; # MS DirectMusic from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended directplay;  # MS DirectPlay from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
# Deprecated                                                directx9;  # MS DirectX 9 (Deprecated, no-op) (Microsoft, 2010) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmband;   # MS dmband.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmcompos; # MS dmcompos.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmime;    # MS dmime.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmloader; # MS dmloader.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmscript; # MS dmscript.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmstyle;  # MS dmstyle.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmsynth;  # MS dmsynth.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dmusic32; # MS dmusic32.dll from DirectX user redistributable (Microsoft, 2006) [downloadable,cached]
               WINEPREFIX=~/.win32 winetricks --unattended dmusic;   # MS dmusic.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
# DirectSound
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dsound;   # MS DirectSound from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dswave;   # MS dswave.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
# Voice
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dpvoice;     # Microsoft dpvoice dpvvox dpvacm Audio dlls (Microsoft, 2002) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dsdmo;       # MS dsdmo.dll DirectSound Effects (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mdx          # Managed DirectX (Microsoft, 2006) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3drm;       # MS d3drm.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx10_43; # MS d3dx10_43.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx10;    # MS d3dx10_??.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx11_42; # MS d3dx11_42.dll (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx11_43;   # MS d3dx11_43.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_24;  # MS d3dx9_24.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_25;  # MS d3dx9_25.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_26;  # MS d3dx9_26.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_27;  # MS d3dx9_27.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_28;  # MS d3dx9_28.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_29;  # MS d3dx9_29.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_30;  # MS d3dx9_30.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_31;  # MS d3dx9_31.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_32;  # MS d3dx9_32.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_33;  # MS d3dx9_33.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_34;  # MS d3dx9_34.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_35;  # MS d3dx9_35.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_36;  # MS d3dx9_36.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_37;  # MS d3dx9_37.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_38;  # MS d3dx9_38.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_39;  # MS d3dx9_39.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_40;  # MS d3dx9_40.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_41;  # MS d3dx9_41.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_42;  # MS d3dx9_42.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9_43;  # MS d3dx9_43.dll (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dx9;     # MS d3dx9_??.dll from DirectX 9 redistributable (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended d3dxof;      # MS d3dxof.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
# Direct X Diagnostics
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dx8vb;         # MS dx8vb.dll from DirectX 8.1 runtime (Microsoft, 2001) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxdiagn_feb2010; # DirectX Diagnostic Library (February 2010) (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxdiagn;       # DirectX Diagnostic Library (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxdiag;        # DirectX Diagnostic Tool (Microsoft, 2010) [downloadable,cached]
# ? WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dxtrans;       # MS dxtrans.dll (Microsoft, 2002) [downloadable,cached]
# Reboot
echo "$Yellow  Rebooting WINE.................................................. $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# Help
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dbghelp;  # MS dbghelp (Microsoft, 2008) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended devenum;  # MS devenum.dll from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
# Direct Input
echo "$Green Direct Input...................................................... $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dinput8;  # MS DirectInput 8 from DirectX user redistributable (Microsoft, 2010) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dinput; # MS dinput.dll; breaks mouse, use only on Rayman 2 etc. (Microsoft, 2010) [downloadable,cached]
# MS Runtime
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended iertutil; # MS Runtime Utility (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended hid;      # MS hid (Microsoft, 2003) [downloadable,cached] 
# MS Runtime Speech
echo "$Green Speech............................................................ $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended sapi;     # MS Speech API (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended sdl;      # Simple DirectMedia Layer (Sam Lantinga, 2012) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended secur32;  # MS Security Support Provider Interface (Microsoft, 2011) [downloadable,cached]
# winetricks wineboot mscms.dll is missing  setupapi               # MS Setup API (Microsoft, 2004) [downloadable,cached]
# conflicts with sapi winetricks --unattended shockwave            # Shockwave (Adobe, 2018) [downloadable]
# conflicts with speechsdk and olderspeechsdk                      # MS Speech SDK 5.1 (Microsoft, 2009) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended tabctl32; # Microsoft Tabbed Dialog Control 6.0 (tabctl32.ocx) (Microsoft, 2012) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended updspapi; # Windows Update Service API (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended urlmon;   # MS urlmon (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended usp10;    # Uniscribe (Microsoft, 2011) [downloadable,cached]
# 
# install crypt32 and wininet that need to be registered
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended crypt32;  # MS crypt32 (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended wininet;  # MS Windows Internet API (Microsoft, 2011) [downloadable,cached]
# win2k wininet_win2k # MS Windows Internet API (Microsoft, 2008) [downloadable,cached]
# Reboot
echo "$Yellow Rebooting WINE................................................... $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# vkd3d install
# I do not think you want to your Proton and DXVK at the same time
# WINEARCH=win32 WINEPREFIX=~/.win32 setup_vkd3d_proton install;
# dxvk install
WINEARCH=win32 WINEPREFIX=~/.win32 setup_dxvk install;
# Reboot
echo "$Yellow Rebooting WINE................................................... $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# Windows Media Player
# failed WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended wmi;  # Windows Management Instrumentation (aka WBEM) Core 1.5 (Microsoft, 2000) [downloadable,cached] win98
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended wmp9;        # Windows Media Player 9 (Microsoft, 2003) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended wmv9vcm;     # MS Windows Media Video 9 Video Compression Manager (Microsoft, 2013) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended wmp10;       # Windows Media Player 10 (Microsoft, 2006) [downloadable]
# Fails WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended wmp11; # Windows Media Player 11 (Microsoft, 2007) [downloadable,cached]
# Codec
echo "$Green Codec............................................................. $Reset";
# fails WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended windowscodecs # MS Windows Imaging Component (Microsoft, 2006) [downloadable,cached]
# Hangs   allcodecs; # All codecs (dirac, ffdshow, icodecs, cinepak, l3codecx, xvid) except wmp (various, 1995-2009) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended dirac;     # The Dirac directshow filter v1.0.2 (Dirac, 2009) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended icodecs;   # Indeo codecs (Intel, 1998) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended cinepak;   # Cinepak Codec (Radius, 1995) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended ffdshow;   # ffdshow video codecs (doom9 folks, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended l3codecx;  # MPEG Layer-3 Audio Codec for Microsoft DirectShow (Microsoft, 2010) [downloadable,cached]
# Hangs WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended xvid;  # Xvid Video Codec (xvid.org, 2009) [downloadable,cached]
# wine Xvid-1.3.2-20110601.exe --mode unattended --decode_divx 1 --decode_3ivx 1 --decode_other 1
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended ogg;   # OpenCodecs 0.85: FLAC, Speex, Theora, Vorbis, WebM (Xiph.Org Foundation, 2011) [downloadable]
# Reboot
echo "$Yellow Rebooting WINE................................................... $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# Fonts
echo "$Green All Fonts......................................................... $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended allfonts;  # All fonts (various, 1998-2010) [downloadable]
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended webio;     # MS Windows Web I/O (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended winhttp;   # MS Windows HTTP Services (Microsoft, 2005) [downloadable,cached]
#
# Access 0328:err:winediag:load_odbc failed to open library "libodbc.so": libodbc.so: cannot open shared object file: No such file or directory
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended art2k7min; # MS Access 2007 runtime (Microsoft, 2007) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended art2kmin;  # MS Access 2000 runtime (Microsoft, 2000) [downloadable]
# Adobe
echo "$Green Adobe............................................................. $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended atmlib;      # Adobe Type Manager (Adobe, 2009) [downloadable,cached]
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended avifil32;    # MS avifil32 (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended binkw32;     # RAD Game Tools binkw32.dll (RAD Game Tools, Inc., 2000) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended cabinet;   # Microsoft cabinet.dll (Microsoft, 2002) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended cmd;       # MS cmd.exe (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended cnc_ddraw;   # Reimplentation of ddraw for CnC games (CnCNet, 2021) [downloadable,cached]
# Preinstalled  winetricks --unattended comctl32ocx;                   # MS comctl32.ocx and mscomctl.ocx, comctl32 wrappers for VB6 (Microsoft, 2012) [downloadable,cached]
# Preinstalled  winetricks --unattended comctl32;                      # MS common controls 5.80 (Microsoft, 2001) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended comdlg32ocx; # Common Dialog ActiveX Control for VB6 (Microsoft, 2012) [downloadable,cached]
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended esent;       # MS Extensible Storage Engine (Microsoft, 2011) [downloadable,cached]
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended filever;     # Microsoft's filever, for dumping file version info (Microsoft, 20??) [downloadable]
# galliumnine
echo "$Green Galliumnine....................................................... $Reset";
# if you do not have an AMD or Intel card uncomment these
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine02; # Gallium Nine Standalone (v0.2) (Gallium Nine Team, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine03; # Gallium Nine Standalone (v0.3) (Gallium Nine Team, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine04; # Gallium Nine Standalone (v0.4) (Gallium Nine Team, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine05; # Gallium Nine Standalone (v0.5) (Gallium Nine Team, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine06; # Gallium Nine Standalone (v0.6) (Gallium Nine Team, 2020) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine07; # Gallium Nine Standalone (v0.7) (Gallium Nine Team, 2020) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine08;   # Gallium Nine Standalone (v0.8) (Gallium Nine Team, 2021) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended galliumnine;     # Gallium Nine Standalone (latest) (Gallium Nine Team, 2019) [downloadable]
#
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended glidewrapper;    # GlideWrapper (Rolf Neuberger, 2005) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended glut;            # The glut utility library for OpenGL (Mark J. Kilgard, 2001) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended gmdls;           # General MIDI DLS Collection (Microsoft / Roland, 1999) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended hid;             # MS hid (Microsoft, 2003) [downloadable,cached]
# ie
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended ie6;              # Internet Explorer 6 (Microsoft, 2002) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended ie7;              # Internet Explorer 7 (Microsoft, 2008) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended -q ie8_kb2936068; # Cumulative Security Update for Internet Explorer 8 (Microsoft, 2014) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended ie8;              # Internet Explorer 8 (Microsoft, 2009) [downloadable]
# echo "ie8_kb2936068 popup error"
# Executing cp -f ~/.win32/dosdevices/c:/Program Files/Internet Explorer/ieproxy.dll ~/.win32/dosdevices/c:/windows/system32/ieproxy.dll
# cp: cannot stat '~/.win32/dosdevices/c:/Program Files/Internet Explorer/ieproxy.dll': No such file or directory
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended iertutil;   # MS Runtime Utility (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended itircl;     # MS itircl.dll (Microsoft, 1999) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended itss;       # MS itss.dll (Microsoft, 1999) [downloadable,cached]
# Hangs                                                   jet40;      # MS Jet 4.0 Service Pack 8 (Microsoft, 2003) [downloadable]
# WINEPREFIX=~/.win32 winetricks --unattended lavfilters702;           # LAV Filters 0.70.2 (Hendrik Leppkes, 2017) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended lavfilters; # LAV Filters (Hendrik Leppkes, 2019) [downloadable]
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended nuget;      # NuGet Package manager (Outercurve Foundation, 2013) [downloadable]
# 
# Preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended ole32;    # MS ole32 Module (ole32.dll) (Microsoft, 2004) [downloadable,cached]
# Preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended oleaut32; # MS oleaut32.dll (Microsoft, 2011) [downloadable,cached]
# 
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended pdh_nt4;  # MS pdh.dll (Performance Data Helper); WinNT 4.0 Version (Microsoft, 1997) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended pdh;        # MS pdh.dll (Performance Data Helper) (Microsoft, 2011) [downloadable,cached]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended peverify;   # MS peverify (from .NET 2.0 SDK) (Microsoft, 2006) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended pngfilt;    # pngfilt.dll (from winxp) (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended prntvpt;    # prntvpt.dll (Microsoft, 2011) [downloadable,cached]
# python
#echo "$Green Python............................................................ $Reset";
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended python26;  # Python interpreter 2.6.2 (Python Software Foundaton, 2009) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended -q python27; # Python interpreter 2.7.16 (Python Software Foundaton, 2019) [downloadable]
# Reboot
echo "$Yellow  Rebooting WINE.................................................. $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# 
echo "$Green Quicktime......................................................... $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended quicktime72;             # Apple QuickTime 7.2 (Apple, 2010) [downloadable]
# Failed WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended -q quicktime76; # Apple QuickTime 7.6 (Apple, 2010) [downloadable]
# Reboot
echo "$Yellow  Rebooting WINE.................................................. $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# MS RichEdit Control
echo "$Green Rich Controls..................................................... $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended riched20; # MS RichEdit Control 2.0 (riched20.dll) (Microsoft, 2004) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended riched30; # MS RichEdit Control 3.0 (riched20.dll, msls31.dll) (Microsoft, 2001) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended richtx32; # MS Rich TextBox Control 6.0 (Microsoft, 2012) [downloadable,cached]
# MS Visual Basic runtime
echo "$Green Visual Basic runtim............................................... $Reset";
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vb2run;   # MS Visual Basic 2 runtime (Microsoft, 1993) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vb3run;   # MS Visual Basic 3 runtime (Microsoft, 1998) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vb4run;   # MS Visual Basic 4 runtime (Microsoft, 1998) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vb5run;   # MS Visual Basic 5 runtime (Microsoft, 2001) [downloadable]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vb6run;   # MS Visual Basic 6 runtime sp6 (Microsoft, 2004) [downloadable,cached]
# Visual C++
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2003; # Visual C++ 2003 libraries (mfc71,msvcp71,msvcr71) (Microsoft, 2003) [downloadable]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2005; # Visual C++ 2005 libraries (mfc80,msvcp80,msvcr80) (Microsoft, 2011) [downloadable]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2008; # Visual C++ 2008 libraries (mfc90,msvcp90,msvcr90) (Microsoft, 2011) [downloadable,cached]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2010; # Visual C++ 2010 libraries (mfc100,msvcp100,msvcr100) (Microsoft, 2010) [downloadable]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2012; # Visual C++ 2012 libraries (atl110,mfc110,mfc110u,msvcp110,msvcr110,vcomp110) (Microsoft, 2012) [downloadable]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2013; # Visual C++ 2013 libraries (mfc120,mfc120u,msvcp120,msvcr120,vcomp120) (Microsoft, 2013) [downloadable]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2015; # Visual C++ 2015 libraries (concrt140.dll,mfc140.dll,mfc140u.dll,mfcm140.dll,mfcm140u.dll,msvcp140.dll,msvcp140_1.dll,msvcp140_atomic_wait.dll,vcamp140.dll,vccorlib140.dll,vcomp140.dll,vcruntime140.dll,vcruntime140_1.dll) (Microsoft, 2015) [downloadable,cached]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2017; # Visual C++ 2017 libraries (concrt140.dll,mfc140.dll,mfc140u.dll,mfcm140.dll,mfcm140u.dll,msvcp140.dll,msvcp140_1.dll,msvcp140_2.dll,msvcp140_atomic_wait.dll,vcamp140.dll,vccorlib140.dll,vcomp140.dll,vcruntime140.dll,vcruntime140_1.dll) (Microsoft, 2017) [downloadable]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun2019; # Visual C++ 2015-2019 libraries (concrt140.dll,mfc140.dll,mfc140u.dll,mfcm140.dll,mfcm140u.dll,msvcp140.dll,msvcp140_1.dll,msvcp140_2.dll,msvcp140_atomic_wait.dll,msvcp140_codecvt_ids.dll,vcamp140.dll,vccorlib140.dll,vcomp140.dll,vcruntime140.dll,vcruntime140_1.dll (Microsoft, 2019) [downloadable,cached]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun6sp6; # Visual C++ 6 SP6 libraries (with fixes in ATL and MFC) (Microsoft, 2004) [downloadable]
# preinstalled WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vcrun6;    # Visual C++ 6 SP4 libraries (mfc42, msvcp60, msvcirt) (Microsoft, 2000) [downloadable,cached]
# ?     Failed WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended vjrun20;   # MS Visual J# 2.0 SE libraries (requires dotnet20) (Microsoft, 2007) [downloadable]
# Reboot
echo "$Yellow  Rebooting WINE.................................................. $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# 
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended xact;    # MS XACT Engine (32-bit only) (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended xinput;  # Microsoft XInput (Xbox controller support) (Microsoft, 2010) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended xmllite; # MS xmllite dll (Microsoft, 2011) [downloadable,cached]
WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended xna31;   # MS XNA Framework Redistributable 3.1 (Microsoft, 2009) [downloadable]
# failed WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended xna40;   # MS XNA Framework Redistributable 4.0 (Microsoft, 2010) [downloadable]
# 02b0:err:msi:ITERATE_Actions Execution halted, action L"NotWinFx4ClientAction" returned 1603
# Reboot
echo "$Yellow  Rebooting WINE.................................................. $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
# OS not supported
# echo "$Red x64 and other OS... $Reset";
# os not supported WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended gfw # MS Games For Windows Live (xlive.dll) (Microsoft, 2008) [downloadable,cached]
# mdac is old nt40
# WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mdac27;       # Microsoft Data Access Components 2.7 sp1 (Microsoft, 2006) [downloadable,cached] nt40
# Hangs WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended mdac28; # Microsoft Data Access Components 2.8 sp1 (Microsoft, 2005) [downloadable,cached]
# x64 Only
# echo "$Blue x64 xact_x64... $Reset";
# WINEARCH=win64 WINEPREFIX=~/win64 winetricks --unattended xact_x64; # MS XACT Engine (64-bit only) (Microsoft, 2010) [downloadable,cached] 
# faudio x64 only does not work on a 32-bit installation. You must use a prefix made with WINEARCH=win64.
# echo "$Blue faudio... $Reset";
# WINEARCH=win32 WINEPREFIX=~/win64 winetricks --unattended faudio1901;   # FAudio (xaudio reimplementation, with xna support) builds for win32 (19.01) (Kron4ek, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/win64 winetricks --unattended faudio1902;   # FAudio (xaudio reimplementation, with xna support) builds for win32 (19.02) (Kron4ek, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/win64 winetricks --unattended faudio1903;   # FAudio (xaudio reimplementation, with xna support) builds for win32 (19.03) (Kron4ek, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/win64 winetricks --unattended faudio1904;   # FAudio (xaudio reimplementation, with xna support) builds for win32 (19.04) (Kron4ek, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/win64 winetricks --unattended faudio1905;   # FAudio (xaudio reimplementation, with xna support) builds for win32 (19.05) (Kron4ek, 2019) [downloadable]
# WINEARCH=win64 WINEPREFIX=~/win64 winetricks --unattended faudio190607; # FAudio (xaudio reimplementation, with xna support) builds for win32 (19.06.07) (Kron4ek, 2019) [downloadable]
# WINEARCH=win32 WINEPREFIX=~/win64 winetricks --unattended faudio1906;   # FAudio (xaudio reimplementation, with xna support) builds for win32 (19.06) (Kron4ek, 2019) [downloadable,cached]
# WINEARCH=win64 WINEPREFIX=~/win64 winetricks --unattended faudio;         # FAudio (xaudio reimplementation, with xna support) builds for win32 (latest) (Kron4ek, 2019) [downloadable]
#
# Nvidia card required for Cuda WINEARCH=win32 WINEPREFIX=~/.win32 winetricks --unattended physx # PhysX (Nvidia, 2021) [downloadable]
#
# Reboot
echo "";echo "";echo "";echo "";echo "";echo "";
echo "$Blue Rebooting WINE... $Reset";
WINEPREFIX=~/.win32 wineserver -k -s; WINEPREFIX=~/.win32 wineserver -k; WINEARCH=win32 WINEPREFIX=~/.win32 wineboot -u; WINEPREFIX=~/.win32 wine winecfg -v win7;
echo "";echo "";echo "";echo "";echo "";echo "";
# End Time
declare -x end_time; end_time="$(date +"%s.%N")";
declare dd dh dm ds TimeRunDays TimeRunHours;
#
TimeEnd="$(date +"%s.%N")";
#
TimeRun="$(echo "${TimeEnd} - ${TimeStart}" | bc)";
# Day
dd="$(echo "${TimeRun}/86400" | bc)";
TimeRunDays="$(echo "${TimeRun}-86400*${dd}" | bc)";
# Hour
dh="$(echo "${TimeRunDays}/3600" | bc)";
TimeRunHours="$(echo "${TimeRunDays}-3600*${dh}" | bc)";
# Minute
dm="$(echo "${TimeRunHours}/60" | bc)";
# Second
ds="$(echo "${TimeRunHours}-60*${dm}" | bc)";
# Print it to screen
LC_NUMERIC=C printf "%d:%02d:%02d:%02.4f\n" "${dd}" "${dh}" "${dm}" "${ds}";
# Done
echo "$Red Finished installing WINE Dlls....................................... $Reset";
#
#
# env WINEPREFIX="~/win32" wine "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\ONLYOFFICE\\ONLYOFFICE Editors.lnk"
# ~/win32/dosdevices/c:/Program Files/ONLYOFFICE/DesktopEditors
# ~/win32/drive_c/Program Files/AutoHotkey/AutoHotkey.exe
# env WINEPREFIX="~/win32" wine ~/win32/drive_c/Program Files/AutoHotkey/AutoHotkey.exe

# env WINEPREFIX="~/win32" wine C:\\ProgramData\\Microsoft\\Windows\\Start\ Menu\\Programs\\AutoHotkey\\AutoHotkey.lnk
# ~/win32/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/AutoHotkey/AutoHotkey.lnk
# ~/win32/dosdevices/c:/Program Files/AutoHotkey
#
# env WINEPREFIX="~/win32" wine "~/win32/drive_c/Program Files/ONLYOFFICE/DesktopEditors/editors.exe"

# env WINEPREFIX="~/win32" wine C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\ONLYOFFICE\\ONLYOFFICE Editors.lnk
# ~/win32/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/ONLYOFFICE/ONLYOFFICE Editors.lnk
#
# env WINEPREFIX="~/.wine32" wine "C:\\users\\$USER\\AppData\\Roaming\\Microsoft\\Windows\\Start\ Menu\\Programs\\Amazon\\Amazon\ Kindle\\Kindle.lnk"
#
# ~/win32/drive_c/windows/system32/
# netapi32.dll to NETAPI32.dll
# iphlpapi.dll
# dnsapi.dll
# ~/win32/drive_c/Program Files/ONLYOFFICE/DesktopEditors/
# Qt5Core.dll
# ##########################################################################

