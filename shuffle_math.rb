arr1 1 3 5 7 9 11 13 15 17 19 21

arr2 0 1 2 3 4  5  6  7  8  9 10

1001 - 101

top: 2n

bottom: 2n + 1

top_shuffle: total_cards[900..-1]


bottom_shuffle: total_cards[0..100]

unshuffled: total_cards[101..899]


top.each_with_index {|number, index| bottom.insert(2*[index])} 



  def zipped(top_array, bottom_array)
    if top_array.length < bottom_array.length
      self.cards = top_array.each_with_index {|number, index| bottom_array.insert((2*index), number)}
    else
      self.cards = bottom_array.each_with_index {|number, index| top_array.insert(((2*index) + 1), number)}
    end






  untouched = space loses 3 value, and index moves right 3
  within_each = bottom = 2n + 1
  top = 2n
 
  shuffled = Array.new(100, nil)

  array.each_with_index.map! do |number, index|
    if index > (cut_point-1)
      shuffled[(2*index)] = number
    elsif index < self.cards_from_top
      shuffled[((2*index)+1)] = number
    else
      shuffled[index+cards_from_top] = number
    end

  end

2.0.0-p247 :001 > [1,2,3,4,5,6,7,8,9,10]
 => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
2.0.0-p247 :002 > [8,1,9,2,10,3,4,5,6,7,8,9,10]
 => [8, 1, 9, 2, 10, 3, 4, 5, 6, 7, 8, 9, 10]
2.0.0-p247 :003 > [8,1,9,2,10,3,4,5,6,7]
 => [8, 1, 9, 2, 10, 3, 4, 5, 6, 7]

 [7, 8, 6, 1, 5, 9, 2, 10, 3, 4]

num.times do |n|
  array[2(n-1)] = array[2(n-1)] + (length - (num+x-1))
end

num.times do |n|
  array[2n-1] = array[2n-1]-n

num.times do |n|
  array[length - num - 1] = array[length - num - 1] - num

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

[8, 1, 9, 2, 10, 3, 4, 5, 6, 7]

[7, 8, 6, 1, 5, 9, 2, 10, 3, 4]

num.times do |n|
  @temp[n-1] << array[-num + n - 1] 
end

num.times do |n|
  array[2n-1] = array[2n - 2]
end

num.times do |n|
  array[2(n-1)] = array[-num + n - 1]
end

num.times do |n|
  array[-num + n - 1] = @temp[n-1]
end

def shuffle

    num_cards.times do |n|
      index = (n - 1)
      index2 = (-num_cards + index)
      @temp[index] = self.cards[index2]
    end

    num_cards.times do |n|
      index = (2*n - 1)
      index2 = (2*n - 2)
      self.cards[index] = self.cards[index2]
    end

    num_cards.times do |n|
      index = (2*n - 2)
      index2 = (-num_cards + (n - 1))
      self.cards[index] = self.cards[index2]
    end

    num_cards.times do |n|
      index = (n - 1)
      index2 = (-num_cards + index)
      self.cards[index2] = @temp[index]
    end
  end




