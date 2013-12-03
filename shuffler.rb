class Shuffler

  attr_accessor :deck, :shuffle_count, :cards
  attr_reader :initial_cards, :cut_point, :blank_array

  def initialize(deck, num)
    @cards = (1..deck).to_a
    @initial_cards = self.cards.dup
    @cut_point = (deck - num)
    @blank_array = Array.new((cut_point - num), nil)
  end

  def equal_original?
    cards == self.initial_cards ? true : false
  end

  def shuffle_to_start(n = 0)
    return n if n > 0 && equal_original?
    shuffle
    shuffle_to_start(n + 1)
  end

  def shuffle
    top_half = top_break
    bottom_half = bottom_break
    zipped(top_half, bottom_half) 
  end

  def top_break
    self.cards.drop(cut_point).concat(blank_array)
  end

  def bottom_break
    self.cards.take(cut_point)
  end

  def zipped(top_array, bottom_array)
    array = top_array.zip(bottom_array)
    self.cards = array.flatten.compact
  end

end