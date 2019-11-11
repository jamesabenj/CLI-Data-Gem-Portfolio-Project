class Game

	attr_accessor :description, :link, :price
	attr_reader :name 

	@@all = []

  	def initialize(name)
    	@name = name
  	end

  	def self.all 
  		@@all 
  	end 
end