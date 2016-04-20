module Pretty
    ( pretty
    ) where

import Types

pretty :: HtmlTag -> String
pretty (P s) = tag "p" s
pretty (H (n, s)) = tag ("h" ++ show n) s
pretty (A (link, s)) = tagWithAttrs "a" s [("href", link)]

tag :: String -> String -> String
tag t s =
    "<" ++ t ++ ">"
        ++ s
    ++ "</" ++ t ++ ">"

tagWithAttrs :: String -> String -> [(String, String)] -> String
tagWithAttrs t s [] = tag t s
tagWithAttrs t s attrs =
    "<" ++ t ++ " " ++ unwords (map sepByEq attrs) ++ ">"
        ++ s
    ++ "</" ++ t ++ ">"
    where sepByEq (attr, val) = attr ++ "='" ++ val ++ "'"
