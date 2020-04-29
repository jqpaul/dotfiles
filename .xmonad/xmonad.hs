import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.StackSet as W

import System.IO
import System.Exit

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/joe/.xmonad/xmobar"
    xmonad $ def {
	manageHook = manageDocks <+> manageHook def,
	layoutHook = avoidStruts  $  layoutHook def,
	handleEventHook = handleEventHook def <+> docksEventHook,
	logHook = dynamicLogWithPP xmobarPP
		{ ppOutput = hPutStrLn xmproc,
		  ppTitle = xmobarColor "green" "" . shorten 50
		},
	borderWidth        = 0,
	terminal           = "alacritty",
	normalBorderColor  = "#000000",
	focusedBorderColor = "#3f3f3f"
	} `additionalKeys`
	[
	  -- F-Keys --
	  ((mod1Mask, xK_F1), spawn "spotify"),
	  ((mod1Mask, xK_F2), spawn "firefox-developer-edition"),
	  ((mod1Mask, xK_F3), spawn "pavucontrol"),
	  ((mod1Mask, xK_F4), spawn "teamspeak3"),
	  ((mod1Mask, xK_F5), spawn "steam"),
	  ((mod1Mask, xK_F6), spawn "discord"),
	  ((mod1Mask, xK_F7), spawn "multimc"),
	  ((mod1Mask, xK_F8), spawn "virtualbox"),
	  ((mod1Mask, xK_F9), spawn "dbeaver"),
	  ((mod1Mask, xK_F10), spawn "vlc"),
	  ((mod1Mask, xK_F11), spawn "zeal"),
	  ((mod1Mask, xK_F12), spawn "firefox --private-window"),

          -- Terminal --
	  ((mod1Mask, xK_Return), spawn "alacritty"),
	  ((mod1Mask .|. shiftMask, xK_Return), spawn "urxvt"),

	  -- Applications --
	  ((mod1Mask, xK_d), spawn "rofi -show"),
	  ((mod1Mask, xK_b), spawn "alacritty -e vifm"),

	  -- Navigation --
	  ((mod1Mask, xK_z), windows W.swapMaster),
	  ((mod1Mask, xK_p), moveTo Next NonEmptyWS),
	  ((mod4Mask .|. controlMask, xK_Right), moveTo Next NonEmptyWS),
	  ((mod1Mask, xK_o), moveTo Prev NonEmptyWS),
	  ((mod4Mask .|. controlMask, xK_Left), moveTo Prev NonEmptyWS),

	  -- Kill --
	  ((mod1Mask .|. shiftMask, xK_e), io (exitWith ExitSuccess)),
	  ((mod1Mask .|. shiftMask, xK_q), kill)
	]
