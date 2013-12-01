class Deck
  attr_accessor :cards

  def initialize(n)
    @cards = (1..n).to_a
  end

  def total_cards
    self.cards.length
  end

end