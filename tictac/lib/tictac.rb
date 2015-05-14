class Tictac
attr_accessor :board

  def initialize
    @board = [0,1,2,3,4,5,6,7,8]
    @moves = 0
  end

  def lets_play
    display_board
    user_input
  end

  def display_board
    puts "\n\n"
    print @board[0, 3].join(' | '), "\n"
    puts "-"*10
    print @board[3, 3].join(' | '), "\n"
    puts "-"*10
    print @board[6, 3].join(' | '), "\n"
    puts "\n\n"
  end

  def user_input
    puts "Where would you like to move? (0-8) >> "
    response = gets.to_i
    @board.insert(response, :x).delete(response)
    move_counter
  end

  def move_counter
    @moves += 1
    puts "\n"
    puts "     ------------"
    puts "     | Moves = #{@moves}|"
    puts "     ------------"
    puts "\n"
    if @moves == 9
      puts "\n\n\n>>>>>>>>>>>>>>>>>>>>Game over<<<<<<<<<<<<<<<<<<<<\n\n\n"
      puts
      `exit`
    else
      lets_play
    end
  end

end

