class RegexTester
	attr_accessor :pattern

	def statements=(statements)
		if(statements.class != [].class)
			raise TypeError, "Not an array"
		else
			@statements = statements
		end
	end
	
	def statements
		@statements
	end
	
	def initialize(pattern = nil)
		@pattern = pattern
	end
	
	def test
		statements.each do |statement|
			if pattern_matches? statement
				puts "MATCH: #{statement}"
			else
				STDERR.puts "NO MATCH: #{statement}"
			end
		end
	end

	private
	def pattern_matches? statement
		statement.match(@pattern) != nil
	end
	
end

regex = RegexTester.new
regex.pattern = pattern = /^(http:\/\/)?(www\.)?[\w\.-]+\.(co\.uk|com|edu|org|net)$/

regex.statements = %w[http://www.google.com apidock.com www.microsoft.com http://www.heimann-family.org http://www.kli.org http://www.acac.net http://www.cmu.edu http://is.hss.cmu.edu www.amazon.co.uk]

puts "------"
regex.test

puts ""
puts ""

cc = RegexTester.new
cc.statements = %w[1234567890123456 1234-5678-9012-3456 1234\ 5678\ 9012\ 3456 1234567890 #1234567890123456 1234|5678|9012|3456]

=begin
cc.pattern = /^(\d{4}[ -]?){4}$/
=end

cc.pattern = /^((\d{4})[ -]?){4}/
cc.test
