class Shuffler

  attr_reader :initial_cards, :cut, :top_cut, :top, :bottom, :extra
  attr_accessor :cards

  def initialize(cards, cut)
    @cards = (1..cards).to_a
    @initial_cards = @cards.dup
    @cut, @top_cut = cut, (cards - cut)
  end

  def shuffle
    cut_deck
    mix_cut_cards
    add_extra_cards
    cards
  end

  def cut_deck
    @bottom = cards[0..(cut-1)]
    @top = cards[(top_cut)..-1]
    @extra = cards[cut..(top_cut-1)]
  end

  def mix_cut_cards
    cut.times do |n|
      cards[2*(n)] = top[n]
      cards[(2*n+1)] = bottom[n]
    end
  end

  def add_extra_cards
    extra.each_with_index do |space, index|
      cards[((2*cut)+index)] = space
    end
  end
end

class Counter

  attr_reader :shuffler_initial_cards, :least_shuffles
  attr_accessor :shuffle_count, :card_cycles, :card_indices, :shuffler

  def initialize(shuffler)
    @shuffler = shuffler
    @shuffler_initial_cards = shuffler.initial_cards
    @card_indices = (0..(shuffler.cards.length - 1)).to_a
    @card_cycles = []
    @shuffle_count = 0
  end

  def shuffle_cards
    shuffler.shuffle
  end

  def display_shufflers_cards
    shuffler.cards
  end

  def check_deck
    card_indices.delete_if do |card|
      if card_eq_original?(card)
        card_cycles << shuffle_count
        true
      end
    end
  end

  def card_eq_original?(card)
    display_shufflers_cards[card] == shuffler_initial_cards[card]
  end

  def one_cycle
    shuffle_cards
    self.shuffle_count += 1
    check_deck
  end

  def find_all_card_cycles
    return card_cycles if card_indices.length.zero?
    until card_indices.length.zero?
      one_cycle
    end
    card_cycles.uniq!
  end

  def find_least_shuffles
    @least_shuffles = card_cycles.reduce(:lcm)
  end

  def shuffles_to_start
    find_all_card_cycles
    find_least_shuffles
  end

end

class Controller
  def initialize
    cards = get_cards
    cut_point = get_cut_point

    shuffler = Shuffler.new(cards, cut_point)
    counter = Counter.new(shuffler)

    start_t = Time.now
    shuffles = counter.shuffles_to_start
    end_t = Time.now

    string_shuffles = convert_num_to_string(shuffles)
    total_time = end_t - start_t

    puts_to_screen(string_shuffles, total_time)
  end

  def get_cards
    puts 'How many cards would you like to use?'
    gets.chomp.to_i
  end

  def get_cut_point
    puts 'Where should the cut point be?'
    @cut_point = gets.chomp.to_i
  end

  def convert_num_to_string(number)
    number = number.to_s
    
    if number.length % 3 == 0
      commas = (number.length / 3).to_i - 1
      remainder = 3
    else
      commas = (number.length / 3).to_i
      remainder = (number.length % 3)
    end
    
    commas.times do |n| 
      number.insert((remainder + (n*3)+(n*1)), ",")
    end

    number
  end

  def puts_to_screen(shuffles, total_time)
    puts "You have to shuffle the deck #{shuffles} times in order to return it to it's original state."
    puts "It took #{total_time} seconds."
  end

end

###############################
#   DRIVER CODE
###############################

Controller.new



###############################

