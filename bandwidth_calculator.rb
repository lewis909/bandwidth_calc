=begin

Transfer Rate Calculator v.2

This simple script allows you to calculate how long it will take to transfer a file from A to B.

written by Lewis Baker 05.02.2016

Updated - added re-run function. 11.02.2016

=end
loop do
	puts "Transfer Rate Calculator v.2"
	puts "============================"
	puts

	#This takes the users input and turns it into a string. The input is transformed into uppercase.
	puts "Please enter the desired file size unit (GB, MB or KB):"
	while select_size_unit = gets.chomp.upcase
		case select_size_unit
		when "GB"
			break
		when "MB"
			break
		when "KB"
			break
		else
			puts
			puts "Invalid input, please Select GB, MB or KB"
			puts
		end
	end


	puts

	#This takes the users input and turn sit into a float
	puts "Please enter file size in #{select_size_unit}:"
	while file_size = gets.to_f
		case file_size
		when 0.0000001...99999999.0
			break
		else
			puts "Invalid input, please enter a number in #{select_size_unit}"
		end
	end



	puts

	#This takes the users input and turn sit into a float
	puts "Please enter transfer rate in Mbps:"
	while transfer_rate = gets.to_f
		case transfer_rate
		when 0.0000001...99999999.0
			break
		else
			puts "Invalid input, please enter a number in Mbps"
		end
	end

	puts


	#This section contains the "power of" logic. it takes a string and returns an integer
	if select_size_unit == "GB"
		size_unit = 3
	elsif select_size_unit == "MB"
		size_unit = 2
	elsif select_size_unit == "KB"
		size_unit = 1
	end

	#This is the formula for converting file data units in to bits divides by transfer rate in bits and returns transfer time in seconds
	x = (file_size * (1024 ** size_unit) * 8) / (transfer_rate * (1000 ** 2))

	#This section takes the output of X and converts it into DD:HH:MM:SS
	t = x
	mm, ss = t.divmod(60)            #=> [4515, 21]
	hh, mm = mm.divmod(60)           #=> [75, 15]
	dd, hh = hh.divmod(24)           #=> [3, 3]
	puts
	puts "---------------------------------------------------"
	puts "The transfer will take:\n \n  %d days, %d hours, %d minutes and %d seconds \n \n to complete running at #{transfer_rate} Mbps." % [dd, hh, mm, ss]
	puts "---------------------------------------------------"
	puts
	puts
	puts "Press y to re-run script, press enter to exit"
	puts
	rerun = gets.chomp.upcase
		if rerun !='Y'
			break
		end
end


test