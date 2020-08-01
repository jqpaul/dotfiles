import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.StackSet as W
import XMonad.Layout.Gaps
import XMonad.Util.NamedScratchpad
import XMonad.ManageHook

import XMonad.Layout.Gaps
import XMonad.Layout.Fullscreen
import XMonad.Layout.BinarySpacePartition as BSP
import XMonad.Layout.Tabbed
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Simplest
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation

import XMonad.Layout.PerWorkspace (onWorkspace) 
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.Spacing (spacing) 
import XMonad.Layout.NoBorders
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Reflect (reflectVert, reflectHoriz, REFLECTX(..), REFLECTY(..))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

    -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.OneBig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.ZoomRow (zoomRow, zoomIn, zoomOut, zoomReset, ZoomMessage(ZoomFullToggle))
import XMonad.Layout.IM (withIM, Property(Role))

import System.IO
import System.Exit

myScratchPads = [ NS "htop" "alacritty -t htop -e gotop" (title =? "htop") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)) ,
                  NS "spotify" "spotify" (resource =? "spotify") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)),
                  NS "zathura" "zathura --data-dir=/home/joe/.local/share/zathura" (resource =? "org.pwmt.zathura") (customFloating $ W.RationalRect (0.62) (0) (0.38) (0.976)),
                  NS "evince" "evince" (resource =? "evince") (customFloating $ W.RationalRect (0.62) (0) (0.38) (0.976)),
                  NS "alacritty" "alacritty -t alacritty" (title =? "alacritty") manageTerm]
    where
    manageTerm = customFloating $ RationalRect l t w h
                 where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w

xmonadStartupHook = do
    spawn "sh /home/joe/Programming/bin/bg.sh 13"

myManageHook = composeAll
    [ className =? "Picture-in-Picture" --> doCenterFloat
	, manageDocks
    ] <+> namedScratchpadManageHook myScratchPads

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/joe/.xmonad/xmobar"
    xmonad $ def {
	manageHook = myManageHook,
    layoutHook = avoidStruts  $  layoutHook def,
    handleEventHook = handleEventHook def <+> docksEventHook,
    startupHook = xmonadStartupHook,
    logHook = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc,
          ppTitle = xmobarColor "green" "" . shorten 50
        },
    borderWidth        = 0,
    terminal         = "alacritty",
    normalBorderColor  = "#000000",
    focusedBorderColor = "#3f3f3f"
    } `additionalKeys` [
      -- F-Keys --
      ((mod1Mask, xK_F1), spawn "spotify"),
      ((mod1Mask, xK_F2), spawn "firefox-developer-edition"),
      ((mod1Mask, xK_F3), spawn "pavucontrol"),
      ((mod1Mask, xK_F4), spawn "teamspeak3"),
      ((mod1Mask, xK_F5), spawn "steam"),
      ((mod1Mask, xK_F6), spawn "pac"),
      ((mod1Mask, xK_F7), spawn "multimc"),
      ((mod1Mask, xK_F8), spawn "virtualbox"),
      ((mod1Mask, xK_F9), spawn "dbeaver"),
      ((mod1Mask, xK_F10), spawn "vlc"),
      ((mod1Mask, xK_F11), spawn "zeal"),
      ((mod1Mask, xK_F12), spawn "firefox --private-window"),
      ((mod1Mask, xK_q), spawn "xmonad --recompile;xmonad --restart"),
	  
          -- Terminal --
      ((mod1Mask, xK_Return), spawn "alacritty"),
      ((mod1Mask, xK_i), namedScratchpadAction myScratchPads "alacritty"),
      ((mod1Mask, xK_u), namedScratchpadAction myScratchPads "htop"),
      ((mod1Mask, xK_s), namedScratchpadAction myScratchPads "spotify"),
      ((mod1Mask, xK_n), namedScratchpadAction myScratchPads "evince"),
      ((mod1Mask, xK_m), namedScratchpadAction myScratchPads "zathura"),
      ((mod1Mask .|. shiftMask, xK_Return), spawn "urxvt"),

      -- Applications --
      ((mod1Mask, xK_d), spawn "rofi -show run"),
      ((mod1Mask, xK_c), spawn "rofi -modi clipboard:greenclip print -show clipboard"),
      ((mod1Mask, xK_b), spawn "alacritty -e vifm"),

      -- Navigation --
      ((mod1Mask, xK_z), windows W.swapMaster),
      ((mod1Mask, xK_p), moveTo Next NonEmptyWS),
      ((mod4Mask .|. controlMask, xK_Right), moveTo Next NonEmptyWS),
      ((mod1Mask, xK_o), moveTo Prev NonEmptyWS),
      ((mod4Mask .|. controlMask, xK_Left), moveTo Prev NonEmptyWS),

	  -- Utils --
      ((mod1Mask .|. shiftMask, xK_p), spawn "~/.xmonad/resources/xkb.sh"),

      -- Kill --
      ((mod1Mask .|. shiftMask, xK_e), io (exitWith ExitSuccess)),
      ((mod1Mask .|. shiftMask, xK_q), kill)]
