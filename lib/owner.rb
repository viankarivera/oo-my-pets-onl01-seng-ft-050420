require "pry"

class Owner
  # code goes here
  attr_accessor :pets
  attr_reader :species, :name

  @@owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs #iterate and look at each dog and for each dog we want to change to nervous and set their owner to nil
    #same for cats 

  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.length
  end
end
