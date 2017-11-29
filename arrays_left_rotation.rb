#!/bin/ruby

# n,k = gets.strip.split(' ')
# n = n.to_i
# k = k.to_i
# a = gets.strip #strip removes spaces
# a = a.split(' ').map(&:to_i) #string to array of strings // bar{|i| i.foo}
# d = d.to_i
# arr_new = []
#
# k.times do
# 	number = a.shift
# 	a.push(number)
# end
# puts arr_new

a =*(1..11)
p a.shift(9)
p a
