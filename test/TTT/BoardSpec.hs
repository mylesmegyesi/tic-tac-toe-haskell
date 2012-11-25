module TTT.BoardSpec (spec) where

import Test.Hspec
import TTT.Board (emptyBoard, isWinner, fromString, markers, size)

spec = do
  context "isWinner" $ do
    it "x is not the winner for an empty board" $
      isWinner emptyBoard 'x' `shouldBe` False

    it "x is not the winner for one move" $
      isWinner (fromString "x        ") 'x' `shouldBe` False

    it "x is not the winner for two move" $
      isWinner (fromString "x  o     ") 'x' `shouldBe` False

    it "x is not the winner for four moves" $
      isWinner (fromString "xx oo    ") 'x' `shouldBe` False

    it "x is the winner on the top row" $
      isWinner (fromString "xxxoo    ") 'x' `shouldBe` True

  context "fromString" $ do
    it "builds a board with no markers" $
      let board = fromString "         "
          m = markers board
      in m `shouldBe` ["   ","   ","   "]

    it "builds a board with one markers" $
      let board = fromString "x        "
          m = markers board
      in m `shouldBe` ["x  ","   ","   "]

    it "builds a board with two markers" $
      let board = fromString "xx       "
          m = markers board
      in m `shouldBe` ["xx ","   ","   "]

    it "builds a board with three markers" $
      let board = fromString "xxx      "
          m = markers board
      in m `shouldBe` ["xxx","   ","   "]

    it "builds a board with scattered markers" $
      let board = fromString "xxx x xx "
          m = markers board
      in m `shouldBe` ["xxx"," x ","xx "]

    it "builds a board with different markers" $
      let board = fromString "xox o xx "
          m = markers board
      in m `shouldBe` ["xox"," o ","xx "]

    it "builds a a four by four board" $
      let board = fromString "1234567890123456"
          m = markers board
      in m `shouldBe` ["1234","5678","9012","3456"]

    it "builds a a four by four with the correct size" $
      let board = fromString "1234567890123456"
      in size board `shouldBe` 4

