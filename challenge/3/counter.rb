#!/usr/bin/env ruby

class Counter
  def initialize(infile)
    file = File.open(infile,"r")
    @content = file.read.split(/\s+/)
    file.close
  end

  def word_count
    total = 0
    @content.each do |word|
      if(/(\w+[\-?\w+]*)/.match(word))
        total+=1
      end
    end
    
    return total
  end

  def character_count
  end
end
