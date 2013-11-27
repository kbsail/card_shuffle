class Shuffler
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def cards
    deck.cards
  end

  def shuffle(break_point)

  end

  def cut_point(num)
    deck.length - num
  end

  def top_break(num)
    @top = cards - cards.take(cut_point(num))
  end

  def bottom_break(num)
    @bottom = cards.take(cut_point(num))
  end

end