# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # Left diagonal
  [6,4,2],  # Right diagonal
  [0,3,6],  # Right vertical
  [1,4,7],  # Middle vertical
  [2,5,8]   # Right vertical
]

#  WIN_COMBINATIONS.each do |combination|
  #  if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
    #      return combination
    #  if board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
    #          return combination
      #end
    #end
      #    false

    #  end
#end

def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board[win_index_1] # value of board at win_index_1
   position_2 = board[win_index_2] # value of board at win_index_2
   position_3 = board[win_index_3] # value of board at win_index_3
   position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
 end
end
#position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1) 

def full?(board)
board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
won?(board) || draw?(board)
end

def winner(board)
  if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end
