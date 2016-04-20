module Types
    ( HtmlTag(P,H)
    ) where

data HtmlTag = P String
             | H (Int, String)
             deriving (Show)
