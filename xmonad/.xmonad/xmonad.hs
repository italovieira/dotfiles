import XMonad
import XMonad.Util.Run (spawnPipe)

main = do
    spawnPipe "xmobar"

    xmonad def
        { modMask  = mod4Mask
        , terminal = "termite"
        }
