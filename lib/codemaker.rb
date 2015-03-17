module MasterMind
	class Codemaker
		attr_reader :code_arr

		def set_code
			@code_arr = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
			return @code_arr
		end

		def reply_to_move(move_arr, code)
			@cp = 0
			@c = 0
			blockedi = []
			blockedj = []
			4.times do |i|
				if move_arr[i] == code[i]
					@cp += 1
					blockedi.push(i)
					blockedj.push(i)
				end
			end

			4.times do |i|
				4.times do |j|
					if move_arr[j] == code[i] && ((not (blockedi.include?(i))) && (not (blockedj.include?(j))))
						@c += 1
						blockedj.push(j)
						blockedi.push(i)
					end
				end
			end
			return [@cp,@c]
		end

	end
end