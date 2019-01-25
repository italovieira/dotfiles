import XMonad
import XMonad.Util.Run (spawnPipe)
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders (smartBorders)

main = do
    spawnPipe "xmobar"

    xmonad desktopConfig
        { modMask  = mod4Mask
        , terminal = "termite"
        , layoutHook = smartBorders $ layoutHook desktopConfig
        }
