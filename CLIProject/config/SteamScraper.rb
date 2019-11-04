require "nokogiri"
require "open-uri"



class Game

attr_accessor :name, :genre, :description

  def initialize(name)
    @name = name
  end

end


class Scraper

  @@games = []
  #@@genres = []
  @@game_links = {}
  @@descriptions = []


  def initialize

    stats = Nokogiri::HTML(open("https://store.steampowered.com/stats/"))
    stats.css('table tr.player_count_row a.gameLink').each do |games|
         game = Game.new(games.text)
         @@games << game
         @@game_links[games.text] = games.attribute('href').value
      end
      counter = 1
      @@game_links.each do |name, link|
      parse_game = Nokogiri::HTML(open(link))
      desc = parse_game.css('div.game_description_snippet').text
      @@descriptions << desc
      counter += 1
      if counter == 11
        break
        end
      #binding.pry
      end
    end

    def self.game_links
      @@game_links
    end

    #def genre
      #Scraper.game_links.each do |name, link|
        #parse_game = Nokogiri::HTML(open(link))
        #parse_game.css('div.blockbg a')[1].text
      #end
    #end


    def top_ten
    puts "The Top 10 by player count. Select a game to get info"

    counter = 1
    top_ten_hash = {}
        @@games.each do |game|
          puts "#{counter}. #{game.name}"
          top_ten_hash[counter] = game.name
          counter += 1
          if counter == 11
            break
          end
        end
      input = gets
      puts @@descriptions[input.to_i]
    end

     #def genres_home
       #puts "Select a Genre"

       #counter = 1
       #@@genres.uniq.sort.each do |genre|
         #puts "#{counter}. #{genre}"
         #counter += 1
       #end
     #end


  def run
    home
    input = gets
    if input.to_i == 1
      top_ten
      top_ten_prompts
    #elsif input.to_i == 2
      #genres_home
    else puts "please make a valid selection or 'exit'"
      home
    end
  end

end
