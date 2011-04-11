#!/usr/bin/env ruby

require 'algorithms'

def knights_travails(start,finish,*forbidden)
	start = Position.new(start)
	finish = Position.new(finish)
	move_memory = {}
	puts "forbidden #{forbidden}"
	pq = Containers::PriorityQueue.new
	if Position.valid_position?(start)
		n = AStarNode.new(start.to_s,start.to_s,0,-Position.distance(start,finish))
		pq.push(n,n.f)
		current = start
		while(!move_memory.include?(finish.to_s) && !pq.empty?)
			current = pq.pop
			puts "current: " + current.data
			if move_memory.has_key?(current.data) 
				if move_memory[current.data].f < current.f
					move_memory[current.data] = current
				end
			else
				move_memory[current.data] = current
			end
			
			knight_moves(Position.new(current.data)).each do |p| 
				if(Position.valid_position?(p) && !forbidden.include?(p.to_s))
					temp = AStarNode.new(p.to_s, current.data, current.g - 3, -Position.distance(p,finish)) 
					pq.push(temp, temp.f )
				end
			end
		end
		node = move_memory[finish.to_s]
		while node.data != start.to_s
			puts "at node #{node.data}, moving to #{node.parent}"
			node = move_memory[node.parent]
		end
	else
		puts "Invalid start position"
		return nil
	end
end

def knight_moves(k)
	[k.up.up.left, k.up.up.right,
	 k.up.right.right, k.right.right.down,
	 k.down.down.right,	k.down.down.left,
	 k.left.left.down, k.up.left.left]
end

class AStarNode
	attr_accessor :data, :parent, :f, :g, :h
	
	def initialize(data, parent, g, h)
		@data = data
		@parent = parent
		@g = g
		@h = h
	end
	
	def f
		g + h
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
		self.to_s.chars.to_a[0]
	end
	
	def num
		self.to_s.chars.to_a[1]
	end
	
	def up
		newPos = Position.new(letter + (num.to_i + 1).to_s)
	end

	def down
		newPos = Position.new(letter + (num.to_i - 1).to_s)
	end
	
	def left
		newPos = Position.new((letter.bytes.to_a[0] - 1).chr + num)
	end
	
	def right
		newPos = Position.new((letter.bytes.to_a[0] + 1).chr + num)
	end
	
	def to_s
		@pos
	end
	
	def self.valid_position?(position)
		/^[ABCDEFGH][1-8]$/.match(position.to_s)	
	end
	
	def self.distance(pos1, pos2)
		(pos2.letter.bytes.to_a[0] - pos1.letter.bytes.to_a[0] + pos2.num.to_i - pos1.num.to_i).abs
	end
end

puts knight_moves(Position.new "A8")
puts knights_travails("A8","B7", "B6")
puts knights_travails("A8","G6", "B6", "C7")