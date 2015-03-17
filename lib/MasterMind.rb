require_relative "./codemaker.rb"
require_relative "./codebreaker.rb"
require_relative "./board.rb"

module MasterMind

	def self.be_the_codebreaker
		puts "The computer will set a code of 4 numbers consisting of numbers between 1 and 6."
		rand_code = Codemaker.new.set_code
		puts "For example, the code may be #{rand_code[0]} #{rand_code[1]} #{rand_code[2]} #{rand_code[3]}"
		puts "You have to guess the code in 12 turns"
		puts "After each turn the computer will give feedback on your guess."
		codemaker = Codemaker.new
		code_arr = codemaker.set_code
		puts "________________________________________________________"
		puts "The Computer has set the code."
		 puts "The code is #{code_arr[0]} #{code_arr[1]} #{code_arr[2]} #{code_arr[3]}"
		puts ""
		turns_left = 12
		board = Board.new
		codebreaker = Codebreaker.new
		12.times do 
			puts "Turns left = #{turns_left}"
			move_arr = codebreaker.get_move
			reply_arr = codemaker.reply_to_move(move_arr, code_arr)
			if board.game_over?(move_arr, code_arr)
				puts "You win. You have broken the code. Congratulations!"
				break
			else
				puts "Correctly positioned numbers: #{reply_arr[0]}"
				puts "Correct numbers (but incorrect positions): #{reply_arr[1]}"
				puts ""
				turns_left -= 1
			end
		end

		if turns_left == 0
			puts "You lose."
			puts "The code was #{code_arr[0]} #{code_arr[1]} #{code_arr[2]} #{code_arr[3]}"
		end
		puts "________________________________________________________"
	end

	def self.be_the_codemaker
		puts "Set a code of 4 numbers consisting of numbers between 1 and 6."
		rand_code = Codemaker.new.set_code
		puts "For example, the code may be #{rand_code[0]} #{rand_code[1]} #{rand_code[2]} #{rand_code[3]}"
		puts "The Computer will try to guess the code in 12 turns"
		puts "After each you will give feedback on the guess."
		puts "________________________________________________________"
		puts ""
		puts "Set the code in your mind or on a piece of paper you have"
		codebreaker = Codebreaker.new
		codemaker = Codemaker.new
		board = Board.new
		all_possible_soluions_arr = codebreaker.all_possible_solutions
		turns_left = 12
		while turns_left > 0
			puts ""
			puts "Turns left = #{turns_left}"
			guess = codebreaker.get_random_guess(all_possible_soluions_arr)
			puts "Computer has guessed #{guess[0]} #{guess[1]} #{guess[2]} #{guess[3]}"
			puts "Enter correctly positioned numbers:"
			cp = gets.chomp
			cp = cp.to_i
			if cp == 4
				puts "The computer has correctly guessed the code."
				puts "Thank you for playing"
				return 0
			end
			puts "Enter correct numbers (but incorrect positions):"
			c = gets.chomp
			c = c.to_i
			all_possible_soluions_arr = codebreaker.process_feedback(guess, cp, c, all_possible_soluions_arr)
			turns_left -= 1
		end
	end

	puts "Welcome to the game of MasterMind!"
	puts ""
	puts "Enter 1 to be the codemaker."
	puts "Enter 2 to be the codebreaker."
	puts "Enter choice: "
	choice = gets.chomp
	puts ""
	puts ""
	case choice
	when "1"
		be_the_codemaker
	when "2"
		be_the_codebreaker
	else
		puts "Invalid Choice"
	end

end