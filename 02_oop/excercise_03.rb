# Now create a smart name= method that can take just a first name or a full name,
# and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    names = name.split
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ''
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(name)
    names = name.split
    self.first_name = names.first
    self.last_name = names.count > 1 ? names.last : ''
  end

  def ==(person)
    if person.name == name
      return true
    else
      return false
    end
  end
end # end class Person

bob = Person.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.name

bob.name = "John Adams"
puts bob.first_name
puts bob.last_name

person1 = "John Smith"
person2 = "John Smith"

puts person1 == person2
