class Shuffler

  attr_accessor :deck
  attr_reader :initial_cards, :cut_point, :array_difference, :blank_array

  def initialize(deck, num)
    @deck = deck
    @initial_cards = deck.cards
    @cut_point = (deck.total_cards - num)
    @array_difference = (cut_point - num)
    @blank_array = Array.new(array_difference, nil)
  end

  def all_cards
    deck.cards
  end

  def equal_original?
    all_cards == self.initial_cards ? true : false
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
    all_cards.drop(cut_point).concat(blank_array)
  end

  def bottom_break
    all_cards.take(cut_point)
  end

  def zipped(top_array, bottom_array)
    array = top_array.zip(bottom_array)
    deck.cards = array.flatten.compact
  end

end