Are the results of a shuffle at all dependent upon past shuffles or is each duffle an atomic action as in, given a deck D, s(D) => D’ where the difference in position for every card in D’ from D is exactly the same no matter the order or state of D? Does the first card always go to the nth position or can it vary from one shuffle to the next? 

def shuffle_count(cards, cut, num)
  shuffle = Shuffler.new(cards, cut)
  n = 1
  shuf(shuffle, num)
  until shuffle.cards.index(num) == (num - 1)
    shuf(shuffle, num)
    n += 1
  end
  n
end





10 and 3 - 21 shuffles

Card 1 - 7 Moves

space0 - ((2*index)+1)
space1 - ((2*index)+1)
space2 - ((2*index)+1)
space3 - ((2*index))  || (index + cut_point)
space4 - ((2*index)-1) || (index + cut_point)
space5 - ((2*index)-2) || (index + cut_point)
space6 - ((2*index)-3) || (index + cut_point)
space7 - ((length - index) - cut_point)          || (index + cut_point) - length
space8 - ((length - index))
space9 - ((length - index)) + cut_point)


Space Modulus

0 % 3 = 0     1
1 % 3 = 1     3
3 % 3 = 0     6
6 % 3 = 0     9
9 % 3 = 0     4
4 % 3 = 1     7
7 % 3 = 1     0

Move Modulus

Move 1 : 1 % 3 = 1     
Move 2 : 2 % 3 = 2     
Move 3 : 3 % 3 = 0     
Move 4 : 3 % 3 = 0     
Move 5 : 5 % 3 = 2     
Move 6 : 3 % 3 = 0     
Move 7 : 3 % 3 = 0

0 - 0
1 - 1
2 - 3
3 - 6
4 - 9
5 - 4
6 - 7
7 - 0
8 - 1
9 - 3
10 - 6

Card 2 - 7 Moves

Move Modulus

Move 1 : 2 % 3 = 2     
Move 2 : 3 % 3 = 0     
Move 3 : 3 % 3 = 0     
Move 4 : 5 % 3 = 2     
Move 5 : 3 % 3 = 0     
Move 6 : 3 % 3 = 0     
Move 7 : 1 % 3 = 1
Move 8 : 2 % 3 = 2     
Move 9 : 3 % 3 = 0     
Move 10 : 3 % 3 = 0
Move 11 : 5 % 3 = 2


0 - 1
1 - 3
2 - 6
3 - 9
4 - 4
5 - 7
6 - 0
7 - 1
8 - 3
9 - 6
10 - 9
11 - 4

Card 3 - 3 Moves

0 - 2
1 - 5
2 - 8
3 - 2
4 - 5
5 - 8
6 - 2
7 - 5
8 - 8
9 - 2
10 - 5

Card 4 - 7

0 - 3
1 - 6
2 - 9
3 - 4
4 - 7
5 - 0
6 - 1
7 - 3
8 - 6
9 - 9
10 - 4

Card 5 - 7

0 - 4
1 - 7
2 - 0
3 - 1
4 - 3
5 - 6
6 - 9
7 - 4
8 - 7
9 - 0
10 - 1

Card 6 - 3 Moves

0 - 5
1 - 8
2 - 2
3 - 5
4 - 8
5 - 2
6 - 5
7 - 8
8 - 2
9 - 5
10 - 8

Card 7 - 7 Moves

0 - 6
1 - 9
2 - 4
3 - 7
4 - 0
5 - 1
6 - 3
7 - 6
8 - 9
9 - 4
10 - 7

Card 8 - 7 Moves

0 - 7
1 - 0
2 - 1
3 - 3
4 - 6
5 - 9
6 - 4
7 - 7
8 - 0
9 - 1
10 - 3

Card 9 - 3 Moves

0 - 8
1 - 2
2 - 5
3 - 8
4 - 2
5 - 5
6 - 8
7 - 2
8 - 5
9 - 8
10 - 2

Card 10 - 7 Moves

0 - 9
1 - 4
2 - 7 
3 - 0
4 - 1
5 - 3
6 - 6
7 - 9
8 - 4
9 - 7
10 - 0



20 and 5 - 20 shuffles

Card 1

0 - 0
1 - 1
2 - 3
3 - 7
4 - 12
5 - 17
6 - 4
7 - 9
8 - 14
9 - 19
10 - 8
11 - 13
12 - 18
13 - 6
14 - 11
15 - 16
16 - 2
17 - 5
18 - 10
19 - 15
20 - 0
21 - 1

Card 2

0 - 1
1 - 3
2 - 7
3 - 12
4 - 17
5 - 4
6 - 9
7 - 14
8 - 19
9 - 8
10 - 13
11 - 18
12 - 6
13 - 11
14 - 16
15 - 2
16 - 5
17 - 10
18 - 15
19 - 0
20 - 1

Card 3

0 - 2
1 - 5
2 - 10
3 - 15
4 - 0
5 - 1
6 - 3
7 - 7
8 - 12
9 - 17
10 - 4
11 - 9
12 - 14
13 - 19
14 - 8
15 - 13
16 - 18
17 - 6
18 - 11
19 - 16
20 - 2

card 4 - 20
card 5 - 20
card 6 - 20
card 7 - 20
card 15 - 20
card 16 - 20

20 and 3 - 14 shuffles

card 1 - 14
card 2 - 14
card 3 - 14
card 4 - 14
card 7 - 14
card 18 - 14
card 19 - 14

100 and 11 - 1476 shuffles

Divided by 2 gives you the answer

11 * 82 = 902
11 * 18 = 198

11 * 100 = 1100

card 1 - 82
card 2 - 82
card 3 - 82
card 4 - 82
card 5 - 18
card 10 - 18
card 11 - 82
card 12 - 82
card 14 - 82
card 15 - 18
card 16 - 82
card 17 - 82
card 18 - 82
card 19 - 82
card 20 - 18
card 21 - 82
card 22 - 82
card 23 - 82
card 24 - 82
card 25 - 82
card 26 - 18
card 27 - 82
card 28 - 82
card 29 - 82
card 30 - 82
card 31 - 18

50 and 13 - 1650

22, 25, 3


13 ((n + 1) / 2)

100 and 13 - 5292 / 2
Other - 252

84, 89, 7

#### FOCUS ON JUST THE FIRST CUT SIZE CARDS


1002 and 100 - 364000
other - 9100

[182, 100, 20].reduce(:lcm) will give a valid response

fact: [2, 7, 13]
fact: [2, 2, 5, 5]
fact: [2, 2, 5]

2^2, 5^2, 7^1, 13^1

100200


1002 and 101 

card 1 - 235
card 2 - 
card 3 - 230  
card 4 - 
card 5 - 
card 7 - 206
card 10 - 
card 11 - 
card 12 - 
card 14 - 
card 15 - 
card 16 - 
card 17 - 50
card 18 - 
card 19 - 
card 20 - 
card 21 -   
card 22 - 
card 23 - 232
card 24 - 
card 25 - 
card 26 - 
card 27 - 
card 28 - 
card 29 - 
card 30 - 
card 33 - 40


