import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Actions.GridSelect
import XMonad.Util.CustomKeys
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  xmonad $ docks defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , terminal = "alacritty"
    , modMask = mod4Mask
    , borderWidth = 3
    , normalBorderColor = "darkgray"
    , focusedBorderColor = "yellow"
    , focusFollowsMouse = False
    , startupHook = startup
    , workspaces = myWorkspaces
    , layoutHook = avoidStruts $ myLayout
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "green" "" . shorten 50
      }
    }
    `additionalKeys`
    [ ((mod4Mask, xK_Tab), goToSelected $ myGsConfig myColorizer)
    ]

startup :: X ()
startup = do
  spawnOnce "alacritty"


myLayout = Full ||| Mirror tiled
  where tiled = Tall 1 (3/100) (3/4)


myColorizer =
  colorRangeFromClassName
    (0x28, 0x2c, 0x34) -- lowest inactive bg
    (0x28, 0x2c, 0x34) -- highest inactive bg
    (0x36, 0x67, 0x99) -- active bg
    (0x4c, 0x56, 0x6a) -- inactive fg
    (0xec, 0xff, 0xf4) -- active fg


myGsConfig colorizer =
  (buildDefaultGSConfig myColorizer)
    { gs_cellheight = 50
    , gs_cellwidth = 300
    , gs_cellpadding = 10
    , gs_originFractX = 0.5
    , gs_originFractY = 0.5
    }

myWorkspaces = ["1:main", "2:doc"]
