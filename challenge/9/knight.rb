#!/usr/bin/env ruby

require 'algorithms'

def knights_travails(start,finish,*forbidden)
	
	start = Position.new(str_to_x_y(start)[0],str_to_x_y(start)[1])
	finish = Position.new(str_to_x_y(finish)[0],str_to_x_y(finish)[1])

	return nil if forbidden.include?(finish.to_s) 
	move_memory = {}
	#puts "forbidden #{forbidden}"
	pq = Containers::PriorityQueue.new
	if Position.valid_position?(start)
		n = AStarNode.new(start,start,0,-Position.distance(start,finish))
		pq.push(n,n.f)
		current = start
		while(!move_memory.include?(finish.to_s) && !pq.empty?)
			current = pq.pop
			#puts "current: " + current.data.to_s
			if move_memory.has_key?(current.data.to_s) 
				if move_memory[current.data.to_s].f < current.f
					move_memory[current.data.to_s] = current
				end
			else
				move_memory[current.data.to_s] = current
			end
			
			knight_moves(current.data).each do |p| 
				if(Position.valid_position?(p) && !forbidden.include?(p.to_s))
					temp = AStarNode.new(p, current, current.g - 3, -Position.distance(p,finish)) 
					pq.push(temp, temp.f )
				end
			end
		end
		node = move_memory[finish.to_s]
		if(node)
			out = [node.data.to_s]
			while node.parent.data.to_s != start.to_s
				node = move_memory[node.parent.data.to_s]
				out.push(node.data.to_s)
			end
			return out.reverse
		else
			return nil
		end
	else
		puts "Invalid start position"
		return nil
	end
end

def knight_moves(k)
	out_moves = []
	moves = [k.up.up.left, k.up.up.right,
			 k.up.right.right, k.right.right.down,
			 k.down.down.right,	k.down.down.left,
			 k.left.left.down, k.up.left.left]
	
	moves.each do |m|
		if Position.valid_position?(m)
			out_moves.push(m)
		end
	end
	out_moves
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

def str_to_x_y(str)
	[str.bytes.to_a[0] - "A".bytes.to_a[0], str.bytes.to_a[1].chr.to_i - 1]
end

class Position
	attr_accessor :pos, :letter, :number, :x, :y
	
	@@reg = /^([ABCDEFGH])([1-8])$/
	
	#string for position -> "A1"
	def initialize(x, y)
		@letter  = ( "A".bytes.to_a[0] + x ).chr
		@number = y + 1
		@x = x 
		@y = y
	end
	
	def up
		newPos = Position.new(@x, @y + 1)
	end

	def down
		newPos = Position.new(@x, @y - 1)
	end
	
	def left
		newPos = Position.new(@x - 1, @y)
	end
	
	def right
		newPos = Position.new(@x + 1, @y)
	end
	
	def to_s
		@letter + @number.to_s
	end
	
	def self.valid_position?(position)
		0 <= position.x && position.x <= 7 && 0 <= position.y && position.y <= 7	
	end
	
	def self.distance(pos1, pos2)
		(pos2.x - pos1.x + pos2.y - pos1.y).abs
	end
end

#cds = str_to_x_y("A1")
#puts knight_moves(Position.new cds[0],cds[1])
#puts knights_travails("A8","B7", "B6")
#puts knights_travails("A8","G6", "B6", "C7")