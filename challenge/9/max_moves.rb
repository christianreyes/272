#!/usr/bin/env ruby

require "./knight"

letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
numbers = ["1","2","3","4","5","6","7","8"]

pairs = []
letters.each do |l|
	numbers.each do |n|
		pairs.push([l,n])
	end
end

lengths = []

pairs.each do |p1|
	pairs.each do |p2|
		pos1 = p1[0]+p1[1]
		pos2 = p2[0]+p2[1]
		move_arr = knights_travails(pos1,pos2)
		#puts "#{pos1} to #{pos2} => #{move_arr.length}" if move_arr
		lengths.push(move_arr.length) if move_arr
	end
end

puts lengths.max