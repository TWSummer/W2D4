def my_min_1(array)
  array.each_index do |idx1|
    return array[idx1] if array.all? { |el| array[idx1] <= el }
  end
end #O(n^2) time complexity

def my_min_2(array)
  return nil if array.empty?
  minimum = array[0]
  (1...array.length).each do |idx|
    minimum = array[idx] if array[idx] < minimum
  end
  minimum
end #O(n) time complexity



array = [0,3,5,-6,16,-2]
p my_min_1(array)
p my_min_2(array)


def sub_sum_1(array)
  sub_array=[]
  i=0
  while i < array.length
    j=i
    while j < array.length
      sub_array << array[i..j]
      j+=1
    end
    i+=1
  end
  sub_array.sort{|arr1,arr2| arr1.reduce(:+) <=> arr2.reduce(:+)}.last.reduce(:+)
end # O(n^2) time complexity


list=[5,3,-7]
p sub_sum_1(list)


def sub_sum_2(array)
  return nil if array.empty?
  max_so_far = array[0]
  current_sum = 0
  array.each do |el|
    current_sum += el
    max_so_far = current_sum if current_sum > max_so_far
    current_sum = 0 if current_sum < 0
  end
  max_so_far
end

list = [2, 3, -6, 7, -6, 7]
p sub_sum_2(list)
