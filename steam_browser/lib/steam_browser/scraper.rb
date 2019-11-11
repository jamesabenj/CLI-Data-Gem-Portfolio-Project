class Scraper



  def initialize

    stats = Nokogiri::HTML(open("https://store.steampowered.com/stats/"))
      counter = 0
      stats.css('table tr.player_count_row a.gameLink').each do |games|
         game = Game.new(games.text)
         game.link = games.attribute('href').value
         game_scrape = Nokogiri::HTML(open(game.link))
         game.description = game_scrape.css('div.game_description_snippet').text
         game.price = game_scrape.css('div.game_purchase_price.price').text
         binding.pry
         Game.all << game
         counter += 1
         if counter == 10
          break
        end 
      end
    end


  def run
    home
    input = gets
    if input.to_i == 1
      top_ten
      top_ten_prompts
    elsif input.delete!("\n") == "exit"
      exit
    else puts "please enter 1 or 'exit'"
      run
    end
  end

end