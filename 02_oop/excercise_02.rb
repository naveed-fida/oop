# Modify the class definition from above to facilitate the following methods.
# Note that there is no name= setter method now
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
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'
