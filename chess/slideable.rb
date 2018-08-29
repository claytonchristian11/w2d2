require 'byebug'
module Slideable 
  
  def horizontal_dirs 
    board1 = self.piece_board 
    current_pos = self.pos 
    new_pos = current_pos.dup 
    all_pos = []
    #sliding down 
    # debugger
    all_pos += one_horizontal(current_pos, 0, 1)
    
    #sliding up 
    all_pos += one_horizontal(current_pos, 0, -1)
    #sliding left 
    all_pos += one_horizontal(current_pos, 1, -1)
    #sliding right 
    all_pos += one_horizontal(current_pos, 1, 1)
    
    all_pos
  end 
  
  
  def one_horizontal(new_pos1, index, direction)
    all_pos = []
    valid_move = true 
    new_pos = new_pos1.dup
    until valid_move == false 
      new_pos[index] += direction     
      if self.piece_board.valid_pos?(new_pos) && self.piece_board[new_pos].is_a?(NullPiece)
        all_pos += new_pos 
      elsif self.piece_board.valid_pos?(new_pos) && self.piece_board[new_pos].color != self.color 
        all_pos += new_pos
        valid_move = false 
      else 
        valid_move = false 
      end 
    end 
    all_pos
  end 
  
  def diagonal_dirs
    board = self.piece_board 
    current_pos = self.pos 
    new_pos = current_pos.dup 
    all_pos = []
    valid_move = true 
    
  end 
  
  def one_diagonal
    
  end 
  
  
  
end 