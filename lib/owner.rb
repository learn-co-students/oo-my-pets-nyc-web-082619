class Owner
  
  
    attr_reader :species
    attr_accessor :pets, :name

    @@all = []
    
    def initialize(species = "human")
      @species = species
      self.class.all << self
      @pets = pets
    end

    def pets
      @pets = {fishes: [], cats: [], dogs: []}
    end
  
    def self.all
      @@all
    end
  
    def self.count
      self.all.count
    end

    def species
      @species = owner
    end
  
    def self.reset_all
      self.reset.all
    end
  
    def say_species
      "I am a #{@species}."
    end
  
    

     

  
    def buy_fish(fish)
      @@pets[:fishes] << Fish.new(fish)
    end
  
    def buy_cat(cat)
      @@pets[:cats] << Cat.new(cat)
    end
  
    def buy_dog(dog)
      @@pets[:dogs] << Dog.new(dog)
    end
  
    def walk_dogs
      @@pets[:dogs].each do |dog|
        dog.mood = 'happy'
      end
    end
  
    def play_with_cats
      @@pets[:cats].each do |cat|
        cat.mood = 'happy'
      end
    end
  
    def feed_cats
      @@pets[:cats].each do |cat|
        cat.mood = 'happy'
      end
    end
  
    def list_pets
      "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
    end
  
    def sell_pets
      pets.each do |pet, arr|
        arr.map do |pet|
          pet.mood = 'nervous'
        end
        arr.clear
      end
    end
  
  end
  