module MasterMind
	class Board
		def game_over?(moves_arr, code_arr)
			if moves_arr == code_arr
				return true
			end
			false
		end

	end
end