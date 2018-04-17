#SetUp-------------------
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
#Input and Player selection
def input_to_index(user_input)
 index = user_input.to_i
 index -= 1
  puts board
end

def turn_count (board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
    end
end

#GamePlay definitions below--------------------
def move(board, index, token = "X")
  board[index] = token
end

def turn(board)
  puts "Please enter 1-9:"
      user_input = gets.strip
    #  input_to_index(user_input)
      index = input_to_index(user_input)
          if
            valid_move?(board, index)
          else
            turn(board)
          end
      move(board, index, value = "X")
      display_board(board)
end

def play(board)
  counter = 0
  loop do
      counter += 1
      turn(board)
        if counter >= 9
          break
      end
  until turn(board) == 9
  turn(board)
   end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Ending Definitions Below--------------------------

def won?(board)
WIN_COMBINATIONS.find do |spot|
  board[spot[0]] == board[spot[1]] && board[spot[0]] == board[spot[2]] && position_taken?(board, spot[0])
  end
end

def full?(board)
  board.none? do |i|
  i == " "
  end
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
  won?(board) != nil || full?(board) == true || draw?(board) == true
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end
