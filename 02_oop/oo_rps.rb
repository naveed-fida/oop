class Player
  attr_accessor :move, :name

  def initialize(player_type)
    @player_type = player_type
    @move = nil
    set_name
  end

  def choose
    if human?
      choice = ''
      loop do
        puts 'Please choose rock, paper, or scissors'
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts 'Sorry, invalid choice.'
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  private

  def human?
    @player_type == :human
  end

  def set_name
    if human?
      name = ''
      loop do
        puts "Please enter your name:"
        name = gets.chomp
        break unless name.empty?
        puts "You have to enter a name"
      end
      self.name = name
    else
      self.name = ['R2D2', 'Hal', 'GERTY', 'Chappie', 'Sonny'].sample
    end
  end
end


class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def play_again?
    puts "Would you like to play agian? (y/n)"
    answer = gets.chomp
    answer.downcase.start_with?('y')
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for Playing Rock, Paper Siccors. Goodbye!'
  end
end

rps = RPSGame.new
rps.play