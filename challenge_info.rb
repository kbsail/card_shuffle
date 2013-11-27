# Shufflin

# Given a deck of n unique cards, cut the deck c cards from the top and perform a perfect shuffle. A perfect shuffle is where you put down the bottom card from the top portion of the deck followed by the bottom card from the bottom portion of the deck. This is repeated until one portion is used up. The remaining cards go on top.

# We want an algorithm that will determine the number of perfect shuffles that will need to happen before the deck returns to its original order. This can be done in any language. A successful solution will solve the problem for 1002 cards and a cut size of 101 in under a second even on a slow machine.

n = number of cards

c = number of cards from the top

deck.cards = 1002
cut_size = 101



top = deck.cards.slice(-101)