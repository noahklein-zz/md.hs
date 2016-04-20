module Pretty
    ( pretty
    ) where

import Types

pretty :: HtmlTag -> String
pretty (P s) = wrapInTag "p" s
pretty (H (n, s)) = wrapInTag ("h" ++ show n) s


wrapInTag :: String -> String -> String
wrapInTag tag s =
    "<" ++ tag ++ ">"
        ++ s
    ++ "</" ++ tag ++ ">"
