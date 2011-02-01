#!/usr/bin/env ruby

class Population

    def initialize (*file)
        @filename = ( file [0] ||= 'citypop.txt' )

    end

    def get_pop_for (state,*filename)

        cities = {}
        pop_file = File.open(@filename)

        pop_file.each_line do |line|
            city, st, population = line.split(/\t/)
            if state == st
                cities[city] = population.chomp
            end
        end

        unless cities.empty?
            puts "Top Cities in #{state}"
            puts "----------------------"
            cities.sort{ |a,b| a[0]<=>b[0] }.each do |city, population|
                puts "#{city} (#{population})"
            end
        else
            puts "#{state} has no cities in the Top 40."
        end
    end

end

test = Population.new
test.get_pop_for("TX")
puts
test.get_pop_for("CA")
puts
test2 = Population.new("citypop_1900.txt")
test2.get_pop_for("NY")
puts
test.get_pop_for("NH")
