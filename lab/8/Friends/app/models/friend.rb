class Friend < ActiveRecord::Base
	
	validates_presence_of :name, :email, :level
	validates_format_of :email, :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	
	FRIENDSHIP_LEVELS = [ ["Casual", 1], 
	 					  ["Good", 2], 
	 					  ["Close", 3], 
	 					  ["Best", 4] ]
	 					  
	 
end
