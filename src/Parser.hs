module Parser
    ( htmlTag
    ) where

import Text.ParserCombinators.Parsec hiding ((<|>), many)
import Control.Applicative hiding (optional)
import Control.Monad

import Types

header :: Parser (Int, String)
header = do
    hashes <- many1 $ char '#'
    spaces
    s <- many (noneOf "\n")
    return (length hashes, s)

htmlHeader :: Parser HtmlTag
htmlHeader = H <$> header

paragraph :: Parser String
paragraph = manyTill anyChar (try $ string "\n\n")

htmlParagrah :: Parser HtmlTag
htmlParagrah = P <$> paragraph

htmlTag :: Parser HtmlTag
htmlTag = htmlHeader <|> htmlParagrah
