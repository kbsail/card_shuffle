class Shuffler

  attr_accessor :deck
  attr_reader :initial_cards, :break_number

  def initialize(deck, num)
    @deck = deck
    @initial_cards = deck.cards
    @break_number = num
  end

  def all_cards
    deck.cards
  end

  def equal_original?
    all_cards == self.initial_cards ? true : false
  end

  def shuffle_to_start(n = 1)
    return n if n > 1 && equal_original?
    shuffle
    shuffle_to_start(n + 1)
  end

  def shuffle
    top_half = top_break
    bottom_half = bottom_break

    if bottom_half.length > top_half.length
      deck.cards = zipped(top_half, bottom_half) + bottom_half.drop(top_half.length)
    else 
      deck.cards = zipped(top_half, bottom_half) 
    end
  end

  def cut_point
  

  def top_break
    cut_point = deck.total_cards - break_number
    all_cards.drop(cut_point)
  end

  def bottom_break
    cut_point = deck.total_cards - break_number
    all_cards.take(cut_point)
  end

  def zipped(top_array, bottom_array)
    array = top_array.zip(bottom_array)
    array.flatten.compact
  end

end