# require_relative 'outcome'
class Tictac
# attr_accessor :board

  def initialize
    @board = [0,1,2,3,4,5,6,7,8]
    @board_value = [0,1,2,3,4,5,6,7,8]
    @moves = 0
  end

  def lets_play
    display_board
    user_input
    move_counter

  end

  def display_board
    puts "\n\n"
    print "      Tic-Tac-Toe\n"
    print "     _____________\n"
    print "      |#{@board[0, 3].join(' | ')}", "|\n"
    print "      |","-"*9,"|\n"
    print "      |#{@board[3, 3].join(' | ')}", "|\n"
    print "      |","-"*9,"|\n"
    print "      |#{@board[6, 3].join(' | ')}", "|\n"
    print "      ==========="
    puts "\n\n"
    # print @board_value displays changed values for testing purposes
  end

  def user_input
    print "Where would you like to move? (0-8) >> "
    response = gets.to_i
    @board.insert(response, :x).delete(response)
    @board_value.insert(response, 50).delete(response)

  end

  def move_counter
    @moves += 1
    puts "\n"
    puts "      ------------"
    puts "      | Moves = #{@moves}|"
    puts "      ------------"
    if @moves == 9
      game_over
      `exit`
    else
      x_outcome
      lets_play
    end
  end

  def x_outcome
    sum1 = @board_value[0]+@board_value[1]+@board_value[2]
    sum2 = @board_value[3]+@board_value[4]+@board_value[5]
    sum3 = @board_value[6]+@board_value[7]+@board_value[8]
    sum4 = @board_value[0]+@board_value[3]+@board_value[6]
    sum5 = @board_value[1]+@board_value[4]+@board_value[7]
    sum6 = @board_value[2]+@board_value[5]+@board_value[8]
    sum7 = @board_value[0]+@board_value[4]+@board_value[8]
    sum8 = @board_value[6]+@board_value[4]+@board_value[2]

      if sum1 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end
      if sum2 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end
      if sum3 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end
      if sum4 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end
      if sum5 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end
      if sum6 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end
      if sum7 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end
      if sum8 == 150
        puts "\n      Player Wins"
        display_board
        game_over
        system(exit)
      end

  end
  def game_over
    puts "\n\n>>>>>>>>>>>>>>>>>>>>Game over<<<<<<<<<<<<<<<<<<<<\n"
  end

end

