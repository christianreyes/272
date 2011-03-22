# Traditional way of creating class methods
class Duck
  def self.talk
    puts "quack"
  end
  def self.walk
    puts "waddle"
  end
end

Duck.singleton_methods # => ["walk", "talk"]


# Another way of creating class methods
class Duck2
  class << self
    def talk
      puts "quack"
    end
    def walk
      puts "waddle"
    end
  end
end

Duck2.singleton_methods # => ["walk", "talk"]
