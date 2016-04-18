import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified Data.Map as M

main = do
  xmproc <- spawnPipe "~/.cabal/bin/xmobar -d ~/.xmonad/.xmobarrc"
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , logHook = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle = xmobarColor "green" "" . shorten 50
        }
    , keys = customKeys <+> keys defaultConfig
    }

customKeys XConfig {XMonad.modMask = modm} = M.fromList
  [ ((modm .|. shiftMask, xK_z), spawn "slock")
  ]
