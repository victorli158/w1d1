class Ghost
  attr_accessor :fragment
  attr_accessor :dictionary

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @dictionary = []
    File.open("dictionary.txt").each {|word| @dictionary << word }
    @current_player = @player1
    @previous_player = @player2
    @fragment = ""
  end

  def fragment
    @fragment
  end

  def play_round
    take_turn(@current_player)
    next_player!
    until lost?(@fragment)
      puts "Current string: #{@fragment}"
      take_turn(@current_player)
      next_player!
    end
    puts "#{@previous_player} lost!"
  end

  def lost?(word)
    @dictionary.include?(word)
  end

  def current_player
    @current_player
  end

  def previous_player
    @previous_player
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn(player)
    puts "Current player: #{player.name}"
    letter = player.guess
    if player.alert_invalid_guess(letter, self) == false
      @fragment += letter
    else
      puts "Invalid guess"
      take_turn(player)
    end
  end

  def valid_play?(string)

  end
end

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "Choose a letter"
    gets.chomp
  end

  def alert_invalid_guess(guess, game)
    temp_fragment = game.fragment + guess
    game.dictionary.none? { |word| word.include?(temp_fragment) == true }
  end
end
