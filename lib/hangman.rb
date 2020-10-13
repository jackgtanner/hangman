  class Player
      def initialize (name)
        @name = name
      end

      def name
        @name
      end
  end


  class Board
      def initialize
        #Ascii display for hangman, 7 moves total
        @hangman_pic = ['''
            +---+
            |   |
                |
                |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
                |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
            |   |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|   |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|\  |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|\  |
           /    |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|\  |
           / \  |
                |
          =========''']

      end

      def display_board (move_number)
        puts @hangman_pic[move_number]          
      end
  end


  class Game
      def initialize
          puts "\n\nWelcome to hangman!"
          puts "What's your name?"
          @player = Player.new(gets.chomp)
          puts "\nHey #{@player.name}\n\n"
      end

      def play
          @board = Board.new()
          @moves = 0
          @board.display_board(@moves)

      end
  end


#   game = Game.new()
#   play_again = ""
#   until play_again === "No"
#       game.play
#       puts 'Play again? Type Yes or No'
#       play_again = gets.chomp
#     until ['Yes', 'No'].include?(play_again)
#       puts 'Invalid input. Type Yes or No'
#       play_again = gets.chomp
#     end
#   end
#   puts "See you next time\n\n"


game = Game.new()
game.play