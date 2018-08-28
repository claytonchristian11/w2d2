
class Piece
  attr_accessor :type, :color

  def initialize(color, board, pos)
    @color = color
    @board = board 
    @pos = pos 
  end
  
  def moves 
    @possible_moves
  end 

  def inspect
    p "#{@type}"
  end
  
end

class NullPiece < Piece
  attr_accessor :type

  def initialize(type = :null)
    @type = type
  end

  def inspect
    p "#{@type}"
  end
end