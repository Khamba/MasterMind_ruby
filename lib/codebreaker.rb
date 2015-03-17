module MasterMind
	class Codebreaker
		def get_move
			puts "Enter move with a space in between:"
			@move = gets.chomp
			@moves_arr = @move.split(" ")
			@moves_arr.length.times do |i|
				@moves_arr[i] = @moves_arr[i].to_i
			end
			return @moves_arr
		end

		def all_possible_solutions
			all_posssible_solutions_arr = []
			6.times do |i|
				6.times do |j|
					6.times do |k|
						6.times do |l|
							all_posssible_solutions_arr.push([i+1,j+1,k+1,l+1])
						end
					end
				end
			end
			return all_posssible_solutions_arr
		end

		def get_random_guess(all_posssible_solutions_arr)
			return all_posssible_solutions_arr[rand(all_posssible_solutions_arr.length)]
		end

		def process_feedback(guess, cp, c, all_posssible_solutions_arr)
			len = all_posssible_solutions_arr.length
			cdmaker = Codemaker.new
			i = 0
			while i < len
				cpn, cn = cdmaker.reply_to_move(guess, all_posssible_solutions_arr[i])
				unless cpn == cp && cn == c
					all_posssible_solutions_arr.delete(all_posssible_solutions_arr[i])
					len -= 1
					i -= 1
				end
				i += 1
			end
			return all_posssible_solutions_arr
		end
	end
end