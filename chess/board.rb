require 'colorize'
require_relative 'piece.rb'
require_relative 'display.rb'
require_relative 'bishop.rb'
require_relative 'pawn.rb'
require_relative 'rook.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'queen.rb'

class Board
  attr_accessor :grid 

  def initialize()
    populate 
  end

  
  def populate
    @grid =
    [
      [Rook.new(:w, self, [0,0]), Knight.new(:w, self, [0,1]), Bishop.new(:w, self, [0,2]), Queen.new(:w, self, [0,3]), King.new(:w, self, [0,4]), Bishop.new(:w, self, [0,5]), Knight.new(:w, self, [0,6]), Rook.new(:w, self, [0,7])],
      [Pawn.new(:w, self, [1,0]), Pawn.new(:w, self, [1,1]), Pawn.new(:w, self, [1,2]), Pawn.new(:w, self, [1,3]) ,Pawn.new(:w, self, [1,4]), Pawn.new(:w, self, [1,5]), Pawn.new(:w, self, [1,6]), Pawn.new(:w, self, [1,7])],
      [Rook.new(:w, self, [2,0]),NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [Pawn.new(:b, self, [6,0]), Pawn.new(:b, self, [6,1]), Pawn.new(:b, self, [6,2]), Pawn.new(:b, self, [6,3]), Pawn.new(:b, self, [6,4]), Pawn.new(:b, self, [6,5]), Pawn.new(:b, self, [6,6]), Pawn.new(:b, self, [6, 7])],
      [Rook.new(:b, self, [7,0]), Knight.new(:b, self, [7,1]), Bishop.new(:b, self, [7,2]), Queen.new(:b, self, [7,3]), King.new(:b, self, [7,4]), Bishop.new(:b, self, [7,5]), Knight.new(:b, self, [7,6]), Rook.new(:b, self, [7,7])]
    ]
  end 
  
  def [](pos)
    x, y = pos
    @grid[x][y]
  end
  
  def []=(pos,val)
    x, y = pos
    @grid[x][y] = val
  end
  
  def move_piece(start_pos, end_pos)
    if valid_pos?(start_pos)
      raise "Starting position is not within range of board"
    elsif valid_pos?(end_pos)
      raise "Ending position is not within range of board"
    elsif self[start_pos].is_a? NullPiece
      raise "Cannot move a Nullpiece (ITS NOT A PIECE)"
    elsif !(self[end_pos].is_a? NullPiece)
      raise "Cannot move to end point: existing piece"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def valid_pos?(pos)
    return false unless pos[0].between?(0,7) && pos[1].between?(0,7)
    true
  end 
  
  def render
    @grid
  end 
  
end

if __FILE__ == $PROGRAM_NAME
  a = Board.new

  rook = a[[2,0]]
  p rook.moves
   
end 

