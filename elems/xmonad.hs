-- ────────────────────────────────────────────────────────────────────────────┐
--                                                                             │
-- Name:    elems/xmonad.hs.tt                                                 │
-- Summary: XMonad configuration.                                              │
-- Authors:                                                                    │
--   - Alessandro Molari <molari.alessandro@gmail.com> (alem0lars)             │
--                                                                             │
-- Project:                                                                    │
--   - Homepage:        https://github.com/alem0lars/configs-xmonad            │
--   - Getting started: see README.md in the project root folder               │
--                                                                             │
-- License: Apache v2.0 (see below)                                            │
--                                                                             │
-- ────────────────────────────────────────────────────────────────────────────┤
--                                                                             │
-- Licensed to the Apache Software Foundation (ASF) under one more contributor │
-- license agreements.  See the NOTICE file distributed with this work for     │
-- additional information regarding copyright ownership. The ASF licenses this │
-- file to you under the Apache License, Version 2.0 (the "License"); you may  │
-- not use this file except in compliance with the License.                    │
-- You may obtain a copy of the License at                                     │
--                                                                             │
--   http://www.apache.org/licenses/LICENSE-2.0                                │
--                                                                             │
-- Unless required by applicable law or agreed to in writing, software         │
-- distributed under the License is distributed on an "AS IS" BASIS, WITHOUT   │
-- WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.            │
-- See the License for the specific language governing permissions and         │
-- limitations under the License.                                              │
--                                                                             │
-- ────────────────────────────────────────────────────────────────────────────┤
<% define_locals do
  variable :"xmonad.terminal.open_cmd", as: :term_open_cmd
  variable :"xmonad.terminal.run_cmd",  as: :term_run_cmd

  variable :"font.name", as: :font_name
  variable :"font.size", as: :font_size
end %>
-- ────────────────────────────────────────────────────────────────────────────┘


-- ┌───────────────────────────────────────────────────────────────────────────┐
-- │                            TABLE OF CONTENTS                              │
-- ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┤
-- │                                                                           │
-- │ •1• imports ⇒ load haskell dependencies                                   │
-- │                                                                           │
-- │ •2• cfg ⇒ meta config, contains customizations as config parameters       │
-- │      │                                                                    │
-- │      ├→ •1• modmask                                                       │
-- │      ├→ •2• terminal                                                      │
-- │      ├→ •3• scratchpad                                                    │
-- │      ├→ •4• fonts                                                         │
-- │      ├→ •5• colors                                                        │
-- │      └→ •6• borders                                                       │
-- │                                                                           │
-- │ •3• details ⇒ define custom data/functions                                │
-- │        │                                                                  │
-- │        ├→ •1• scratchpads                                                 │
-- │        └→ •2• xpconfig                                                    │
-- │                                                                           │
-- │ •4• fields ⇒ define `xconfig` fields                                      │
-- │        │                                                                  │
-- │        ├→ •1• hooks                                                       │
-- │        ├→ •2• workspaces                                                  │
-- │        └→ •3• hotkeys                                                     │
-- │                                                                           │
-- │ •5• xconfig ⇒ xmonad configuration record                                 │
-- │        │                                                                  │
-- │        ├→ •1• hooks                                                       │
-- │        ├→ •2• workspaces                                                  │
-- │        ├→ •3• hotkeys                                                     │
-- │        ├→ •4• borders                                                     │
-- │        └→ •5• terminal                                                    │
-- │                                                                           │
-- │ •6• entrypoint ⇒ xmonad main function                                     │
-- │                                                                           │
-- │ •7• types ⇒ custom types                                                  │
-- │       │                                                                   │
-- │       ├→ •1• fonts                                                        │
-- │       └→ •2• colors                                                       │
-- │                                                                           │
-- └───────────────────────────────────────────────────────────────────────────┘


-- ───────────────────────────────────────────────────────────── imports •1• ──┐

import XMonad
import XMonad.Hooks.UrgencyHook (dzenUrgencyHook)
import XMonad.Hooks.EwmhDesktops (ewmh)

-- ────────────────────────────────────────────────────────────────────────────┘


-- ───────────────────────────────────────────────────────────────── cfg •2• ──┐

-- ───────────────────────────────────────────────────── modmask ← cfg •2.1• ──┤

modMask = mod4Mask

-- ──────────────────────────────────────────────────── terminal ← cfg •2.2• ──┤

terminal = "<%= local! :term_open_cmd %>"

-- ────────────────────────────────────────────────── scratchpad ← cfg •2.3• ──┤

scratchpadSize = W.RationalRect (1/4) (1/4) (1/2) (1/2) -- TODO: check if correct

-- ─────────────────────────────────────────────────────── fonts ← cfg •2.4• ──┤

font = Font { name = "<%= local! :font_name %>"
            , size = "<%= local! :font_size %>"
            }

-- ────────────────────────────────────────────────────── colors ← cfg •2.5• ──┤

colors = ColorPalette { darkerGrey   = Color "151515"
                      , darkGrey     = Color "1C1C1C"
                      , grey         = Color "404040"
                      , lightGrey    = Color "888888"
                      , lighterGrey  = Color "E8E8D3"
                      , darkRed      = Color "B85335"
                      , red          = Color "CF6A4C"
                      , darkGreen    = Color "799D6A"
                      , green        = Color "99AD6A"
                      , orange       = Color "FFB964"
                      , yellow       = Color "FAD07A"
                      , blue         = Color "5771A0"
                      , darkBlue     = Color "375385"
                      , magenta      = Color "8787AF"
                      , lightMagenta = Color "C6B6EE"
                      , cyan         = Color "668799"
                      , lightCyan    = Color "8FBFDC"
                      }

bgColor = colors darkerGrey -- TODO: check if correct
fgColor = colors lightGrey -- TODO: check if correct

bgHighlightColor = colors darkGrey -- TODO: check if correct
fgHighlightColor = colors lighterGrey -- TODO: check if correct

-- ───────────────────────────────────────────────────── borders ← cfg •2.6• ──┤

borderWidth = 1 -- TODO: check if correct

normalBorderColor = colors grey -- TODO: check if correct

focusedBorderColor = colors darkBlue -- TODO: check if correct

-- ────────────────────────────────────────────────────────────────────────────┘


-- ───────────────────────────────────────────────────────────── details •3• ──┐

-- ───────────────────────────────────────────── scratchpads ← details •3.1• ──┤

scratchpadFloat = customFloating scratchpadSize
scratchpads =
  [ NS "term" myTerminal      (title =? "term")    scratchpadFloat
  , NS "top"  (run "htop")    (title =? "htop")    scratchpadFloat
  <% if has_feature? :python %>
  , NS "ipy"  (run "ipython") (title =? "ipython") scratchpadFloat
  <% end %>
  <% if has_feature? :ruby %>
  , NS "irb"  (run "irb")     (title =? "irb")     scratchpadFloat
  <% end %>
  <% if has_feature? :haskell %>
  , NS "ghci" (run "ghci")    (title =? "ghci")    scratchpadFloat
  <% end %>
  ]
  where
    term cmd = "<%= local! :term_run_cmd %>" cmd

scratchpadKeymap =
  [ ("M-a t", namedScratchpadAction scratchpads "term")
  , ("M-a i", namedScratchpadAction scratchpads "top")
  <% if has_feature? :python %>
  , ("M-a p", namedScratchpadAction scratchpads "ipy")
  <% end %>
  <% if has_feature? :ruby %>
  , ("M-a r", namedScratchpadAction scratchpads "irb")
  <% end %>
  <% if has_feature? :haskell %>
  , ("M-a h", namedScratchpadAction scratchpads "ghci")
  <% end %>
  , ("M-a w",   workspacePrompt xpConfig (windows . W.greedyView))
  , ("M-a M-w", workspacePrompt xpConfig (windows . W.shift))
  , ("M-a m", manPrompt xpConfig)
  , ("M-a d", changeDir xpConfig)
  , ("M-a s", sshPrompt xpConfig)
  ]

-- ──────────────────────────────────────────────── xpConfig ← details •3.2• ──┤

xpConfig = defaultXPConfig
  { font = "xft:" ++ font
  , fgColor = fgColor
  , bgColor = bgColor
  , fgHLight = fgHighlightColor
  , bgHLight = bgHighlightColor
  , borderColor = fgColor
  , position = Top
  }

-- ────────────────────────────────────────────────────────────────────────────┘


-- ────────────────────────────────────────────────────────────── fields •4• ──┐

-- ──────────────────────────────────────────────────── hooks ← fields •4.1• ──┤

-- lets you configure an action to occur when a window demands your attention
-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Hooks-UrgencyHook.html
-- TODO check if correct
myUrgencyHook = dzenUrgencyHook { args = ["-bg", "darkgreen", "-xs", "1"] }

-- TODO check if correct
myLayout = smartBorders $ onWorkspace "8" simpleFloat standardLayouts
  where
    standardLayouts = tall ||| wide ||| full ||| circle ||| gimpLayout
    tall   = named "tall"   $ avoidStruts basic
    wide   = named "wide"   $ avoidStruts $ Mirror basic
    circle = named "circle" $ avoidStruts circleSimpleDefaultResizable
    full   = named "full"   $ noBorders Full
		tabbedLayout = tabbedBottomAlways shrinkText defaultTheme
    gimpLayout	 = tabbedLayout ****||* Full

-- TODO check if correct
myManageHook = composeAll . concat $
    [ [namedScratchpadManageHook scratchpads]
    , [isFullscreen   --> doFloat]
    , [isDialog       --> doFloat]
    , [className =? c --> doFloat | c <- myCFloats]
    , [title     =? t --> doFloat | t <- myTFloats]
    , [resource  =? r --> doFloat | r <- myRFloats]
    , [resource  =? i --> doIgnore | i <- myIgnores]
    -- Needs refactor with fizzy vars for personal arrangements
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift "1:irc" | x <- my1Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift "2:www" | x <- my2Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShift "3:music" | x <- my3Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "4:misc" | x <- my4Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "5:xbmc" | x <- my5Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "6:GIMP" | x <- my6Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "7:slideshow!" | x <- my7Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "8:foo()" | x <- my8Shifts]
    , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "9:vbox" | x <- my9Shifts]
    ]
    where
    doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myCFloats = ["XFontSel", "Xmessage", "Event Tester", "Arandr", "Pavucontrol", "Nm-connection-editor"]
    myTFloats = ["Save As..."]
    myRFloats = []
    myIgnores = []
    my1Shifts = []
    my2Shifts = []
    my3Shifts = []
    my4Shifts = []
    my5Shifts = []
    my6Shifts = []
    my7Shifts = []
    my8Shifts = []
    my9Shifts = []

-- TODO, seems a good starting point check if correct
-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Hooks-EwmhDesktops.html
myHandleEventHook = ewmhDesktopsEventHook

-- TODO check if correct
-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Hooks-DynamicLog.html
myLogHook h = dynamicLogWithPP $ defaultPP
  { ppOutput          = hPutStrLn h
  -- Color palette needs refactor with fizzy vars for personal arrangements (if xmobar)
	-- there is also for dzen2
  , ppCurrent         = xmobarColor "#ee9a00" "#1B1D1E" . shorten 50
  , ppHiddenNoWindows = xmobarColor "#7b7b7b" "#1B1D1E" . shorten 50
  , ppHidden          = xmobarColor "white"   "#1B1D1E" . shorten 50
  , ppUrgent          = xmobarColor "red"     "#1B1D1E" . xmobarStrip
  , ppVisible         = xmobarColor "white"   "#1B1D1E" . shorten 50
  , ppTitle           = (" " ++) . xmobarColor "#35acdb" ""
	-- TOCHOOSE
  -- no NSP showing up at the end of workspace list
  , ppSort            = fmap (.scratchpadFilterOutWorkspace) $ ppSort defaultPP
  -- , ppSort            = fmap (.scratchpadFilterOutWorkspace) getSortByTag
  }

-- TODO, LG3D yes/no?
-- myStartupHook = return ()
myStartupHook = ewmhDesktopsStartup >> setWMName "LG3D"

-- ─────────────────────────────────────────────── workspaces ← fields •4.2• ──┤

-- TODO
myWorkspaces =

-- ─────────────────────────────────────────────── workspaces ← fields •4.3• ──┤

-- TODO fizzy vars for personal arrangements
myKeys =

-- TODO I do not have ones
myMouseBindings =

-- TODO I do not have ones
myFocusFollowsMouse =

-- TODO I do not have ones
myClickJustFocuses =

-- ────────────────────────────────────────────────────────────────────────────┘


-- ───────────────────────────────────────────────────────────── xconfig •5• ──┐

xConfig = defaultConfig
  {
  -- ───────────────────────────────────────────────── hooks ← xconfig •5.1• ──┤
    XMonad.layoutHook         = myLayout
  , XMonad.manageHook         = myManageHook
  , XMonad.handleEventHook    = myHandleEventHook
  , XMonad.logHook            = myLogHook xmproc
  , XMonad.startupHook        = myStartupHook
  -- ──────────────────────────────────────────── workspaces ← xconfig •5.2• ──┤
  , XMonad.workspaces         = myWorkspaces
  -- ─────────────────────────────────────────────── hotkeys ← xconfig •5.3• ──┤
  , XMonad.modMask            = modMask
  , XMonad.keys               = myKeys
  , XMonad.mouseBindings      = myMouseBindings
  , XMonad.focusFollowsMouse  = myFocusFollowsMouse
  , XMonad.clickJustFocuses   = myClickJustFocuses
  -- ─────────────────────────────────────────────── borders ← xconfig •5.4• ──┤
  , XMonad.borderWidth        = borderWidth
  , XMonad.normalBorderColor  = normalBorderColor
  , XMonad.focusedBorderColor = focusedBorderColor
  -- ────────────────────────────────────────────── terminal ← xconfig •5.5• ──┤
  , XMonad.terminal           = terminal
  }

-- ────────────────────────────────────────────────────────────────────────────┘


-- ────────────────────────────────────────────────────────── entrypoint •6• ──┐

main = do
  xmonad $ withUrgencyHook myUrgencyHook $ ewmh xConfig

-- ────────────────────────────────────────────────────────────────────────────┘


-- ─────────────────────────────────────────────────────────────── types •7• ──┐

-- ───────────────────────────────────────────────────── fonts ← types •7.1• ──┤

data Font = Font { name :: String
                 , size :: Int
                 }

instance Show Font where
         show f = show $ (f name) ++ "-" ++ (f size)

-- ──────────────────────────────────────────────────── colors ← types •7.2• ──┤

data Color = String

instance Show Color where
         show c = show $ "#" ++ c

data ColorPalette = ColorPalette { darkerGrey   :: Color
                                 , darkGrey     :: Color
                                 , grey         :: Color
                                 , lightGrey    :: Color
                                 , lighterGrey  :: Color
                                 , darkRed      :: Color
                                 , red          :: Color
                                 , darkGreen    :: Color
                                 , green        :: Color
                                 , orange       :: Color
                                 , yellow       :: Color
                                 , blue         :: Color
                                 , darkBlue     :: Color
                                 , magenta      :: Color
                                 , lightMagenta :: Color
                                 , cyan         :: Color
                                 , lightCyan    :: Color
                                 }

-- ────────────────────────────────────────────────────────────────────────────┘


-- vim: set filetype=eruby.haskell :
