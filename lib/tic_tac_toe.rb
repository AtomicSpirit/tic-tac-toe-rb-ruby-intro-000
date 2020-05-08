WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
  return index
end

def move(board, index, player_token)   # Either player_token is x or o.
  board[index] = player_token
  if player_token == "X" || player_token == "x"
    return "X"
  elsif player_token == "O" || player_token == "o"
    return "O"
end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
  return false
else
  return true
end
end

def valid_move?(board, index)
  if !position_taken?(board, index)  && index.between?(0, 8)
    return true
end
end




def turn_count(board)
  counter = 0
  board.each do |spaces|
    if spaces == "X" || "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "O" : "X"
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner(board) == "X" || winner(board)"O"
    puts "Congratualtions #{winner(board)}"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      turn(board)
    end
display_board(board)
end
