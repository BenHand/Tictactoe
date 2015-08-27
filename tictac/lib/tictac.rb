# require_relative 'outcome'
require 'pry'
class Tictac
# attr_accessor :board

  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
    @board_value = [1,2,3,4,5,6,7,8,9]
    @computer_board = [1,2,3,4,5,6,7,8,9]
    @player_one = "Player 1"
    @player_two = "Player 2"
  end

  def lets_play
    @moves = 0
    puts "2 Player mode? (y/n)"
    response = gets.chomp
    case response
    when 'y'
      player_one_name
      player_two_name

      while @moves < 9
        display_board
        user_one_input
        x_outcome
        user_two_input
        o_outcome
      end
    else
      player_one_name
      @player_two = "Computer"

      while @moves < 9
        display_board
        user_one_input
        x_outcome
        computer
        o_outcome
      end
    end
  end

  def player_one_name
    puts "Player one name please >> "
    @player_one = gets.chomp.upcase
  end

  def player_two_name
    puts "Player two name please >> "
    @player_two = gets.chomp.upcase
  end

  def display_board
    puts "\n\n"
    print "                   Tic-Tac-Toe\n"
    print "                  _____________\n"
    print "                   |#{@board[0, 3].join(' | ')}", "|\n"
    print "                   |","-"*9,"|\n"
    print "                   |#{@board[3, 3].join(' | ')}", "|\n"
    print "                   |","-"*9,"|\n"
    print "                   |#{@board[6, 3].join(' | ')}", "|\n"
    print "                   ==========="
    puts "\n\n"
    # print @board_value # displays changed values for testing purposes
  end

  def user_one_input
    print "#{@player_one}: Where would you like to move? (1-9) >> "
    response = gets.chomp.to_i
    if @board.include?(response) == false
      puts "Invalid input, please try again."
      user_one_input
    else
      place_move(response, :x, 50)
      display_board
      move_counter
    end
  end

  def place_move(pick, sym, value)
    @board.insert(pick, sym).delete(pick)
    @board_value.insert(pick, value).delete(pick)
  end

  def user_two_input
    print "#{@player_two}: Where would you like to move? (1-9) >> "
    response = gets.chomp.to_i
    if @board.include?(response) == false
      puts "Invalid input, please try again."
      user_two_input
    else
      place_move(response, :o, 100)
      display_board
      move_counter
    end
  end

  def move_counter
    @moves += 1
    puts "\n"
    puts "                   ------------"
    puts ">>>>>>>>>>>>>>>>>>>| Moves = #{@moves}|<<<<<<<<<<<<<<<<<<<"
    puts "                   ------------"
    if @moves >= 9
      puts = "There is no winner."
      replay?
    end
  end

  def computer
    computer_pick = @board.sample
    if @computer_board.include?(computer_pick) == true
      place_move(computer_pick, :o, 100)
      display_board
      move_counter
    else
      computer
    end
  end

  def x_outcome
    possible_outcomes.each do |sum|
      if sum == 150
        display_board
        puts "\n                  #{@player_one} Wins"
        replay?
        break
      end
    end
  end

  def possible_outcomes
    sum1 = @board_value[0]+@board_value[1]+@board_value[2]
    sum2 = @board_value[3]+@board_value[4]+@board_value[5]
    sum3 = @board_value[6]+@board_value[7]+@board_value[8]
    sum4 = @board_value[0]+@board_value[3]+@board_value[6]
    sum5 = @board_value[1]+@board_value[4]+@board_value[7]
    sum6 = @board_value[2]+@board_value[5]+@board_value[8]
    sum7 = @board_value[0]+@board_value[4]+@board_value[8]
    sum8 = @board_value[6]+@board_value[4]+@board_value[2]
    outcomes = [sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8]
  end

  def o_outcome
    possible_outcomes.each do |sum|
      if sum == 300
        display_board
        puts "\n                  #{@player_two} Wins"
        replay?
        break
      end
    end
  end

  def replay?
    puts "Would you like to play again? (y/n) >> "
    response = gets.chomp
    if response == 'y'
      Tictac.new.lets_play
    else
      game_over
    end
  end

  def game_over
    puts "\n\n>>>>>>>>>>>>>>>>>>>>Game over<<<<<<<<<<<<<<<<<<<<<\n"
    puts "                 ^^^^Goodbye^^^^"
    system(exit)
  end

end

