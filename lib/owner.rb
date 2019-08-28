class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  private def pets(pets=Pet.all)
    pets.select{|pet| pet.owner == self}
  end

  def cats
    pets(Cat.all)
  end

  def dogs
    pets(Dog.all)
  end

  private def buy_pet(pet_type, name)
    pet_type.new(name, self)
  end

  def buy_cat(name)
    buy_pet(Cat, name)
  end

  def buy_dog(name)
    buy_pet(Dog, name)
  end

  private def pets_set_mood!(pets, mood)
    pets.each{|pet| pet.mood = mood}
  end

  private def pets_set_owner!(pets, owner)
    pets.each{|pet| pet.owner = owner}
  end

  def walk_dogs
    pets_set_mood!(dogs, "happy")
  end

  def feed_cats
    pets_set_mood!(cats, "happy")
  end

  def sell_pets
    pets_set_mood!(pets, "nervous")
    pets_set_owner!(pets, nil)
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end




end