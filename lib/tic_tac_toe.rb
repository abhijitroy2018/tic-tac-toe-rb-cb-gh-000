# All methods & constants go here.

# Defining constant
WIN_COMBINATIONS = [
       [0, 1, 2],
       [3, 4, 5],
       [6, 7, 8],
       [0, 3, 6],
       [1, 4, 7],
       [2, 5, 8],
       [0, 4, 8],
       [2, 4, 6]
]

# Displays the current state of the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Converts string user input to board array index
def input_to_index(user_input)
  user_input.to_i - 1
end

# Move the token 'X' or 'O' to user-specified board position
def move(board, index, current_player)
  board[index] = current_player
end

# Checks for empty board positions
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Check if the move is valid
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

# Asks the user for move recursively
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# Counts the total #turns played
def turn_count(board)
  total_turns_played = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      total_turns_played += 1
    end
  end
  return total_turns_played
end



  