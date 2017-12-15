require 'benchmark'

def first_anagram?(str1, str2)
  str1.chars.permutation.map(&:join).include?(str2)
end # O(n!)

def second_anagram?(str1, str2)
  idx1 = 0
  str1=str1.chars
  str2=str2.chars
  while idx1 < str1.length
    char = str1[idx1]
    idx2 = str2.index(char)
    return false if idx2.nil?
    str2.delete_at(idx2)
    str1.delete_at(idx1)
    idx1 += 1
  end
  str1==str2
end #O(n^2)

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")
#
#
# p second_anagram?("gizmo","sally")
# p second_anagram?("elvis","lives")


def third_anagram?(str1,str2)
  str1.chars.sort==str2.chars.sort
end # O(n log n)



#
# p third_anagram?("gizmo","sally")
# p third_anagram?("elvis","lives")


def fourth_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.chars.each do |ch|
    hash[ch] += 1
  end
  str2.chars.each do |ch|
    hash[ch] -= 1
  end
  hash.all?{ |k, v| v == 0 }
end # O(n)



# p fourth_anagram?("gizmo","sally")
# p fourth_anagram?("elvis","lives")

str1 = ""
str2 = ""
1000000.times do
  str1 << ("a".."z").to_a.sample
  str2 << ("a".."z").to_a.sample
end

Benchmark.bm(10) do |x|
  # x.report("first_anagram? ") {first_anagram?(str1, str2)}
  # x.report("second_anagram?") {second_anagram?(str1, str2)}
  x.report("third_anagram? ") {third_anagram?(str1, str2)}
  x.report("fourth_anagram?") {fourth_anagram?(str1, str2)}
end
