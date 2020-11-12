class TicTacToe

    attr_accessor :board

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

    def initialize 
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(position)
        @board[position] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count {|character| character == "X" || character == "O"}
    end
    # returned a number 3 because there are 2 x'x and 1 o on the the board

    def current_player
        if turn_count.even?
            "X"
        else
            "O"
        end
    end
    # who's turn is it?  there are three moves total, so the third move was X, we must return x

    def turn
        user_input = gets.chomp
        index = input_to_index(user_input)
            if valid_move?(index)
                piece = current_player
                move(index, piece)
                display_board
            else
                user_input = gets.chomp
            end
    end    

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[1])
        end  
    end    
   
    def full?
        @board.none? do |input|
            input == " "
        end
    end    

    def draw?
        if won? || !full?
            false
        else 
            true
        end
    end    

    def over?
        if won? || full?
            true
        end
    end    
   
    def winner
        if won?
            @board[won?[0]]
        end
    end    
   

    def play
        while !over?
           turn        
        end
    end

end

