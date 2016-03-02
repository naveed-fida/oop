# Add a class method to your MyCar class that calculates the gas mileage of any car

class MyCar
  attr_accessor :speed
  attr_reader :year, :color

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

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

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
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