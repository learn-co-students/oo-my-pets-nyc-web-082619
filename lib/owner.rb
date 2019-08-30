class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize (name, species = "human")
    @name = name 
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
  
  def dogs 
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  
  def buy_cat(name)
    Cat.new(name,self)
  end
  
  def buy_dog(name)
    Dog.new(name,self)
  end
  
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.all_pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil 
    end

  end

  def all_pets
    allPet = []
    Dog.all.each do |dog|
      allPet << dog 
    end
    Cat.all.each do |cat|
      allPet << cat 
    end
    allPet
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    self.all.count 
  end
  
  def self.reset_all
    self.all.clear
  end
  
  
end