# Define a method sum which takes an array of integers as an argument 
# and returns the sum of its elements. For an empty array it should return zero.
def sum(arr)
    return 0 if arr.empty?
    arr.inject(:+)
end

raise 'sum([]) != 0' unless sum([]) == 0
raise 'sum([1, 2, 3])' unless sum([1, 2, 3]) == 6

# Receives an array max2=[n1, n2] and a n
# and returns an array with the biggest 2
# numbers of the set [n1, n2, n]
def upd_max2(max2, n)
# podem haver repetidos
# return max2 if max2.include? n

  # ordena e devolve um array
  # com os 2 maiores elementos
  (max2 << n).sort.drop(1)
end

raise 'upd_max2([1,2], 2)' unless upd_max2([1,2], 2) == [2,2]
raise 'upd_max2([1,2], 3)' unless upd_max2([1,2], 3) == [2,3]
raise 'upd_max2([5,4], 3)' unless upd_max2([5,4], 3) == [4,5]


# Define a method max_2_sum which takes an array of integers as an argument
# and returns the sum of its two largest elements. For an empty array it should
# return zero. For an array with just one element, it should return 
# that element.
def max_2_sum(arr)
  return 0 if arr.empty?
  return arr[0] if arr.count == 1
  return arr.reduce( :+ ) if arr.count == 2

  seed = [arr[0], arr[1]]

  # tiramos os 2 primeiros
  # que ja estao contemplados na seed
  totraverse = arr.drop(2)
  max2 = totraverse.inject(seed) { |max2, elem| upd_max2(max2, elem) }

  max2.reduce( :+ )
end

raise 'max_2_sum([1,2,3])' unless max_2_sum([1,2,3]) == 5
raise 'max_2_sum([3,2,1])' unless max_2_sum([3,2,1]) == 5
raise 'max_2_sum([1,2])' unless max_2_sum([1,2]) == 3
raise 'max_2_sum([2,1])' unless max_2_sum([2,1]) == 3
raise 'max_2_sum([3])' unless max_2_sum([3]) == 3
raise 'max_2_sum([])' unless max_2_sum([]) == 0
raise 'max_2_sum([1,4,2,4])' unless max_2_sum([1,4,2,4]) == 8
raise 'max_2_sum([1,4,2,3])' unless max_2_sum([1,4,2,3]) == 7

# Define a method sum_to_n? which takes an array of integers and an additional
# integer, n, as arguments and returns true if any two distinct elements in the
# array of integers sum to n. An empty array or single element array should
# both return false.
def sum_to_n?(arr, n)
  return false if arr.empty? or arr.count == 1
  combs = arr.combination(2).to_a
  # puts 'arr.combination(2).to_a= ' + combs.join(',').to_s
  # puts 'found ' + n.to_s + '? ' + ((combs.find { |e| e.reduce( :+ ) ==  n }) != nil).to_s

  # return true if sum of any = n
  combs.find { |e| e.reduce( :+ ) ==  n } != nil
end

raise 'sum_to_n?([], 4)' unless sum_to_n?([], 4) == false
raise 'sum_to_n?([4], 3)' unless sum_to_n?([4], 3) == false
raise 'sum_to_n?([4,3], 6)' unless sum_to_n?([4,3], 6) == false
raise 'sum_to_n?([4,3], 7)' unless sum_to_n?([4,3], 7) == true
raise 'sum_to_n?([4,3,1], 5)' unless sum_to_n?([4,3,1], 5) == true
