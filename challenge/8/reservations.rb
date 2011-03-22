#!/usr/bin/env ruby
class Reservations
  def initialize(infile="Sandpiper.txt")
    @flights = {}
    @file = infile
	load_flights(@file)
	do_menu
  end
  
  def load_flights(file=nil)
    @file = file unless file.nil?
	
	fdata = File.open(@file,"r")
    fdata.each do |line|
		content = line.split("\t")
		#         flight #                flight #  smoking  non-smoking
		@flights[content[0]]= Flight.new(content[0],content[1],content[2])
    end
    fdata.close
  end
  
  def do_menu
    continue = true
	puts "Loaded " + num_flights.to_s + " flights into the system"
	
	while(continue)
		puts ""
		puts "Choose Option: (P)rint flights, (M)ake Reservation, (L)ist Reservations, (Q)uit:"
		option = gets.chomp.upcase
		puts ""
		
		case option
		when "Q"
			opt_q
			continue = false
		when "P"
			opt_p
		when "M"
			opt_m
		end
	end
  end
	
  def num_flights
	return @flights.keys.length
  end
  
  def opt_q
	f = File.new(@file, "w")
	@flights.each do |flight|
		f.puts flight[1].number + "\t" + flight[1].smoking.to_s + "\t" + flight[1].nonsmoking.to_s
	end
	f.close
	
	puts "File #{@file} was successfully written"
  end
  
  #print the flights
  def opt_p
	puts "            Flights             "
	puts "================================"
	puts "#\tSmoking\tNon-Smoking"
	puts "================================"
	a = @flights.to_a
	a.sort 
	a.each do |f|
		puts f[1].to_s
	end
  end
  
  def opt_m
	puts "Enter flight number:"
	num = gets.chomp	
	if(@flights[num])
		f = @flights[num]
		seats = -1 if f.smoking <  5 && f.nonsmoking <  5
		seats =  0 if f.smoking <  5 && f.nonsmoking == 5
		seats =  1 if f.smoking == 5 && f.nonsmoking <  5
		seats =  2 if f.smoking == 5 && f.nonsmoking == 5
		
		case seats
		when -1
			puts "Type of seat: (S)moking, (N)on-smoking, (C)ancel?"
			opt = gets.chomp.upcase	
			case opt
			when "S"
				f.boarding_pass("S")
			when "N"
				f.boarding_pass("N")
			end
		when 0 
			puts "Only smoking seats are available. Continue? (Y)/(N):"
			opt = gets.chomp.upcase
			if(opt == "Y")
				f.boarding_pass("S")
			end
		when 1
			puts "Only non-smoking seats are available. Continue? (Y)/(N):"
			opt = gets.chomp.upcase
			if(opt == "Y")
				f.boarding_pass("N")
			end
		when 0
			puts "No seats are available."
		end
	else
		puts "#{num} not a valid flight number"
	end	
  end
end

class Flight
attr_accessor :number, :smoking, :nonsmoking

	def initialize(number,smoking, nonsmoking)
		@number = number
		@smoking = smoking.to_i
		@nonsmoking = nonsmoking.to_i
	end
	
	def to_s
		return @number + "\t" + @smoking.to_s + "\t" + @nonsmoking.to_s
	end
	
	def boarding_pass(type)
		if(type == "S")
			puts "You have successfully been assigned to a smoking seat"
			puts ""
			puts "=============Boarding Pass==============="
			puts "Flight #{@number}\tSeat: #{@smoking+1}\tSmoking: Yes"
			puts "========================================="
			@smoking = @smoking + 1
		else
			puts "You have successfully been assigned to a non-smoking seat"
			puts ""
			puts "=============Boarding Pass==============="
			puts "Flight #{@number}\tSeat: #{@smoking+1}\tSmoking: No"
			puts "========================================="
			@nonsmoking = @nonsmoking + 1
		end
	end
	
	def <=>(o)
		return @number <=> o.number
	end
end

program = Reservations.new
