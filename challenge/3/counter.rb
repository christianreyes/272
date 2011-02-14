#!/usr/bin/env ruby

class Counter
  def initialize(infile)
    file = File.open(infile,"r")
    @content = file.read.split(/\s+/)
    @words = Array.new
    @content.each do |word|
      if(/(\w+[\-?\w+]*)/.match(word))
        @words = @words + [word]
        puts "adding word " + word
      end
    end
    file.close
  end

  def word_count
    return @words.length
  end

  def character_count
    total = 0
    puts
    @words.each do |word|
      puts word
      total += word.length
    end

    return total
  end
end
