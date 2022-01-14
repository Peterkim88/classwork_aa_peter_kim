#build a board, class for board
#game needs to have variation board sizes 

#classes for board: 

## class for card #more sudo code awaiting
### array of cards (capital letters)
### class method self.random_cards(size)
### initialize
### size in self.random_cards or initialize
### self.random_card becomes @random_card do it twice (card 1 and card 2)
### hide for flipping over the card - @face_value = true/false
### for hiding mark as true - showing will be false
### 'reveal' to mark face_value to true
### to_s

## class for ai


class Card

  CARDS = ("A".."Z").to_a

  def self.random_card(size)
    cards = CARDS
    i = 0
    random_letters = []
    while i < (size / 2)
      card = cards.pop
      if !random_letters.include?(card)
        2.times { random_letters << card }
        i += 1
      end
    end
    random_letters
  end

  def initialize(size)
    @cards = Card.random_card(size)
  end

  def get_cards
    @cards
  end

end