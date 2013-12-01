require_relative 'deck'
require_relative 'shuffler'


puts 'How many cards would you like to use?'
cards = gets.chomp.to_i

new_deck = Deck.new(cards)

puts 'Where should the cut point be?'
cut_point = gets.chomp.to_i

shuffler = Shuffler.new(new_deck, cut_point)

start_t = Time.now
times = shuffler.shuffle_to_start
end_t = Time.now

total_time = end_t - start_t

puts "You have to shuffle it #{times} times."
puts "It took #{total_time}"