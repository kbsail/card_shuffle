class Deck
  attr_accessor :cards

  def initialize(n)
    @cards = (1..n).to_a
  end

  def length
    self.cards.length
  end

end