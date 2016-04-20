module Types
    ( HtmlTag(P,H,A)
    ) where

data HtmlTag = P String
             | H (Int, String)
             | A (String, String)
             deriving (Show)
