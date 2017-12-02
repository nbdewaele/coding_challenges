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

#################
# gets
# cde
# abc

# removed = []
# a = gets.strip.split("")
# removed << a
# b = gets.strip.split("")
# removed << b
#
# intersection = []
# intersection << (a & b)
# intersection.flatten!
# p removed.flatten.length - intersection.length - intersection.length

# .select enumerator might fix this
# puts (1..5).select { |num|
#   num.even?
# }

##############




# 6 4
# give me one grand today night
# give one grand today

# array = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
#
# # Return the uppercased version.
# array.map(&:upcase)
# => ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY"]

def note_boolean(m, n)
	m,n = gets.strip.split(' ')
	m = m.to_i
	n = n.to_i
	magazine = gets.strip
	magazine = magazine.split(' ').sort
	ransom = gets.strip
	ransom = ransom.split(' ').sort

	paste_bin = []

	magazine.each do |word|
	  if ransom.include? word
	    paste_bin << word
			if paste_bin == ransom
				return "Yes"
			else
				return "No"
			end
	  end
	end
end


puts note_boolean(6, 4)
