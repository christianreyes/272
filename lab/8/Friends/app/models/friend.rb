class Friend < ActiveRecord::Base
	
	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :level
	validates_format_of :email, :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_format_of :website, :with => /^(http:\/\/)?(www\.)?[\w\.-]+\.(co\.uk|com|edu|org|net)$/
	validates_format_of :phone, :with => /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
	
	scope :all, order(:name.asc)
	
	
	FRIENDSHIP_LEVELS = [ ["Casual", 1], 
	 					  ["Good", 2], 
	 					  ["Close", 3], 
	 					  ["Best", 4] ]
	 					  
	def category
		return FRIENDSHIP_LEVELS[self.level][0]
	end
end
