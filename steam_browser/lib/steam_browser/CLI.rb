

	def home
		puts "Welcome to the Steam Browser! You can browse the Top 10 most popular games below."

		puts "1. Start"
	
		puts "enter 'exit' to leave program"
	end

	def top_ten
    	puts "The Top 10 by player count. Select a game to get info."

    	counter = 1
        Game.all.each do |game|

          puts "#{counter}. #{game.name}"
          counter += 1
        end
      	input = gets
      	if input.to_i.between?(1,10)
      		puts Game.all[input.to_i - 1].description.gsub /^\s*/, ''
      		
      		puts "Price: #{Game.all[input.to_i - 1].price.gsub /^\s*/, ''}"
      		
      		puts "Get: #{Game.all[input.to_i - 1].link}"
		elsif input.delete!("\n") == "exit" 
			exit 
		else puts "Please select a number 1-10 or 'exit'."
			top_ten
		end    		
    end

	def top_ten_prompts
		loop do
		puts "Would you like to browse more games?"
		puts "1. Yes"
		puts "2. No"
		input = gets
		if input.to_i == 1
			top_ten
		elsif input.to_i == 2
			exit
		else puts "please select 1 or 2"
			top_ten_prompts
			end
		end
 	end


