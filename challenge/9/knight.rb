#!/usr/bin/env ruby

def knights_travails(start,finish,*forbidden)
	start = Position.new(start)
	if Position.valid_position?(start)
		
	else
		puts "Invalid start position"
		return nil
	end
end

class Position
	attr_accessor :pos
	
	@@reg = /^([ABCDEFGH])([1-8])$/
	
	#string for position -> "A1"
	def initialize(pos)
		@pos = pos
	end
	
	def letter
		captures = @@reg.match(self.to_s).captures
		return captures[0]
	end
	
	def num
		captures = @@reg.match(self.to_s).captures
		return captures[1]
	end
	
	def up
		newPos = Position.new(letter + (num.to_i + 1).to_s)
		if Position.valid_position?(newPos)
			return newPos
		else
			nil
		end
	end

	def down
		newPos = Position.new(letter + (num.to_i - 1).to_s)
		if Position.valid_position?(newPos)
			return newPos
		else
			nil
		end
	end
	
	def left
		newPos = Position.new((letter.bytes.to_a[0] - 1).chr + num)
		if Position.valid_position?(newPos)
			return newPos
		else
			nil
		end
	end
	
	def right
		newPos = Position.new((letter.bytes.to_a[0] + 1).chr + num)
		if Position.valid_position?(newPos)
			return newPos
		else
			nil
		end
	end
	
	def to_s
		@pos
	end
	
	def self.valid_position?(position)
		/^[ABCDEFGH][1-8]$/.match(position.to_s)	
	end
end

p = Position.new("B2")
puts "self:  " + p.to_s
puts "up:    " + p.up.to_s
puts "right: " + p.right.to_s
puts "down:  " + p.down.to_s
puts "left:  " + p.left.to_s