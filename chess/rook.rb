require_relative 'slideable.rb'

class Rook < Piece 
  
  include Slideable
  
  def moves 
    self.horizontal_dirs 
  end 
  
end 