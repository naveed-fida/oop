# Create a class called MyCar. When you initialize a new instance or object of the class,
# allow the user to define some instance variables that tell us the year, color, and model
# of the car. Create an instance variable that is set to 0 during instantiation of the
# object to track the current speed of the car as well. Create instance methods that allow the
# car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :speed
   attr_reader :year, :color

  def initialize(yr, clr, mdl)
    @speed = 0
    @year = yr
    @color = clr
    @model = mdl
  end

  def spray_paint(clr)
    @color = spray_paint
  end

  def speed_up(mph)
    self.speed += mph
  end

  def brake(mph)
    self.speed -= mph
  end

  def shut_down
    puts "The car has been shut down"
    self.speed = 0
  end

end

civic = MyCar.new(2014, 'black', 'civic')
puts "car speed: #{civic.speed}" 
civic.speed_up(10)
puts "car speed: #{civic.speed}"
civic.brake(5)
puts "car speed #{civic.speed}"
civic.shut_down
puts "car speed #{civic.speed}"