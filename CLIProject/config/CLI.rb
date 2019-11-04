require_relative "./SteamScraper.rb"



	def home
	puts "Welcome to the Steam Scraper! You can browse the Top 10 most popular games below."

	puts "1. Top 10"
	#puts "2. Genres"


	puts "enter 'exit' to leave program"
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

## need to debug and code in genre functionality
	#def genres_home
		#puts "Select a Genre"

		#counter = 1

		#@@genres.uniq.sort.each do |genre|
			#puts "#{counter}. #{genre}"
			#counter += 1
		#end

	#end
