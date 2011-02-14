#!/usr/bin/env ruby

class Counter
  def initialize(infile)
    file = File.open(infile,"r")
    content = file.read.split(/[\s\.\?\;\:\!\,\"\(\)]+/)
    @words = Array.new
    content.each do |word|
      data = /(\w+\-?\w*)/.match(word)
      if(data)
        @words = @words + data.captures
      end
    end
    file.close
  end

  def word_count
    return @words.length
  end

  def character_count
    return @words.inject(0){ |sum,word| sum + word.length }
  end
end
