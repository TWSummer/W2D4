def brute_force(array, target_sum)
  array.each_index do |idx1|
    array.each_index do |idx2|
      next if idx1 == idx2
      return true if array[idx1] + array[idx2] == target_sum
    end
  end
  false
end #O(n^2)

def sorting(array, target_sum)
  array.sort!
  start = 0
  finish = array.length - 1
  while start < finish
    result = array[start] + array[finish]
    return true if result == target_sum
    if result > target_sum
      finish -= 1
    else
      start += 1
    end
  end
  false
end #O (n log n)

arr = [0, 1, 5, 7]
p brute_force(arr, 6)
p brute_force(arr, 10)

p sorting(arr, 6)
p sorting(arr, 10)



def two_sum?(array,sum)
  hash=Hash.new(0)
  array.each do |el|
    hash[el] += 1
  end
  hash.each do |k, v|
    if v > 1 || sum - k != k
      return true if hash.key?(sum - k)
    end
  end
  false
end # O(n)


p two_sum?(arr, 6)
p two_sum?(arr, 10)
