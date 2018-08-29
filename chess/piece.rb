
class Piece
  attr_accessor :color, :piece_board, :pos

  def initialize(color, piece_board, pos)
    @color = color
    @piece_board = piece_board 
    @pos = pos 
  end
  

  
  def inspect
    p "#{@pos}"
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