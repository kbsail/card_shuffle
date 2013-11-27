class Shuffler
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def cards
    deck.cards
  end

  def shuffle(num)
    top_half = top_break(num)
    bottom_half = bottom_break(num)
    
  end

  def top_break(num)
    cut_point = deck.length - num
    @top = cards - cards.take(cut_point)
  end

  def bottom_break(num)
    cut_point = deck.length - num
    @bottom = cards.take(cut_point)
  end



end