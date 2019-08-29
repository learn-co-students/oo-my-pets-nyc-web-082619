require "pry"
class Owner
  attr_reader :name, :species
  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
  end

  def cats
    Cat.all.select{|cat|cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog|dog.owner == self}
  end

  def pets
    self.cats.concat(self.dogs)
  end

  def buy_cat(name)
    self.cats << Cat.new(name, self)
  end

  def buy_dog(name)
    self.dogs << Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each{|dog| dog.mood = 'happy'}
  end 

  def feed_cats
    Cat.all.each{|cat| cat.mood = 'happy'}
  end
  

  def sell_pets
    self.pets.each do |pet| 
      pet.mood = 'nervous'
      pet.owner = nil
    end
    self.pets.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end