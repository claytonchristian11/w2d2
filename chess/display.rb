require 'colorize'
require_relative 'cursor.rb'

class Display
  
  attr_accessor :cursor, :board1

  def initialize(board)
    @board1 = board 
    @cursor = Cursor.new([0,0], board)
  end
  
  def test_cursor
    while (true) 
      render 
      @cursor.get_input
    end 
  end 
  
  def render 
    pos1 = @cursor.cursor_pos
    (0..7).to_a.each do |i1|
      (0..7).to_a.each do |i2|
        pos2 = [i1,i2]
        if pos1 == pos2
          print "#{@board1[pos1].type}".colorize(:red)
          print " "
        elsif @board1[pos2].is_a? NullPiece 
          print "null "
        else
          print @board1[pos2].type
          print " "
        end 
      end 
      puts
    end
    puts 
  end 


end
