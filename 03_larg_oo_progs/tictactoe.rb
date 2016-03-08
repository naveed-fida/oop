class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
                   [1, 5, 9], [3, 5, 7]] # diags

  def initialize
    @squares = {}
    reset
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)    
  end

  # Return a winning marker or nil
  def detect_winner
    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '.freeze
  attr_accessor :marker
  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    self.marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end

  def mark
  end
end

class TTTGame
  attr_reader :board, :human, :computer
  COMPUTER_MARKER = 'O'
  HUMAN_MARKER = 'X'

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe. Goodbye!'
  end

  def human_moves
    puts "Choose a square #{board.unmarked_keys.join(', ')} "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, wrong input."
    end    
    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def clear
    system 'clear'
  end

  def display_board(options = { clear_screen: true})
    clear if options[clear_screen]
    puts "You are a #{human.marker}. Computer is a #{computer.marker}"
    puts ''
    puts '     |     |'
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts '     |     |'
    puts ''
  end

  def display_result
    display_board
    case board.detect_winner
    when human.marker
      puts 'Human won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Do you wanna play again? (y or n):"
      answer = gets.chomp
      break if %w(y n).include? answer
      puts "Must be either y or n"
    end

    answer == 'y'
  end

  def play
    display_welcome_message
    clear
    loop do
      display_board(false)
      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        break if board.someone_won? || board.full?

        display_board
      end

      display_result
      break unless play_again?
      board.reset
      clear
      puts "Let's play again."
      puts ''
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play
