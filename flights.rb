require 'time'

def average_time_of_arrival (times)
	valid_time_pattern = /^(\d{1,2}):(\d{1,2})(am|pm)/
	
	total = 0;
	arr_time = Array.new
	
	times.each do |time|	
		match_data = time.match(valid_time_pattern)
		if(match_data == nil)
			puts "Please check input times"
			arr_time = Array.new
			break
		else
			t = Time.parse(time)
			#60 seconds in 60 minutes in 24 hours. It will advance the time by a day
			if(t.hour < 10)
				t = t + 60 * 60 * 24 
			end
			#	puts "#{time} #{t}"
			arr_time.insert(0,t)
			total = t.to_i + total
		end
	end	
	
	if(arr_time.length > 0)
		arr_time.sort!
		sum = total - arr_time[0].to_i * arr_time.length
		average = sum / arr_time.length
		puts "Average time #{Time.at(arr_time[0] + average)}"
	end
end

arr = ["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]
average_time_of_arrival(arr)

arr = ["11:51am", "11:56am", "12:01pm", "12:06pm", "12:11pm"]
average_time_of_arrival(arr)

arr = ["6:41am", "6:51am", "7:01am"]
average_time_of_arrival(arr)

arr = ["11:51am", "11:56am", "12:01pm", "12:06pm", "12:11pm"]
average_time_of_arrival(arr)