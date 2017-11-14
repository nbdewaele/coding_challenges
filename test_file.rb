# Given two strings, a and b, that may or may not be of the same length, determine the minimum number of character deletions required to make a and b anagrams. Any characters can be deleted from either of the strings.
# Sample input:
# cde
# abc
# Sample Output:
# 4

# Anagram is rearrangement of words

a = "cde"
b = "abc"

puts a.chomp("de")
puts b.sub('ab', '')

# 13:30 $ ruby test_file.rb
# => c
# => c
