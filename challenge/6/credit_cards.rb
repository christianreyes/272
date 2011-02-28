#!/usr/bin/env ruby
require 'date'
class CreditCard
	def initialize(number,exp_year,exp_month)
		@number = number.to_s
		@exp_year = exp_year
		@exp_month = exp_month
	end
	
	def valid?
		if(Date.new(@exp_year,@exp_month) < DateTime.now)
			return false
		end
		
		good = false
		#VISA
		good = good || !@number.match(/^(4(\d{12}|\d{15}))$/).nil?
		#AMEX
		good = good || !@number.match(/^(34|37)\d{13}$/).nil?
		#MASTERCARD
		good = good || !@number.match(/^(51|52|53|54|55)\d{14}/).nil?
		#Diners Club / Carte Blanche
		good = good || !@number.match(/^((300|301|302|303|305)\d{11}|(36|38)\d{12})/).nil?
		#Discover
		good = good || !@number.match(/^6011\d{12}/).nil?
		#enRoute
		good = good || !@number.match(/^(2014|2149)\d{11}/).nil?
		#JCB
		good = good || !@number.match(/^3\d{15}/).nil?
		#JCB
		good = good || !@number.match(/^(2131|1800)\d{11}/).nil?
		
		return good
	end
end

