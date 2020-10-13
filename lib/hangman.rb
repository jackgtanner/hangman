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
        get_new_code
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

        
        
        @hangman_code = []
        @turns = []
            for i in 1..@hangman.length
                @hangman_code << " _ " 
            end
        end

      def display_board (failed_moves)
        puts @hangman_pic[failed_moves]   
        puts "\n\nWord: #{@hangman_code.join}\n\n"       
      end

      def is_choice_valid (choice)
        if choice.length > 1
            puts "Invalid input, you may only choose 1 letter"
            return false
        elsif choice.length < 1
            puts "You cant enter nothing"
            return false
        else return true
        end 
      end

      def get_new_code
        @temp = File.readlines('5desk.txt').sample.downcase
        @hangman = []
        @hangman = @temp.split("")
        for i in 0..3
            @hangman.pop
        end
        @hangman = @hangman.join
      end

      def check_code(guess)
        if @turns.include?(guess)
            puts "You've already tried that!"
            return false
        elsif@hangman.include?(guess)
            puts "its in there!\n\n"
            @turns.push(guess)
            for i in 0..(@hangman.length-1)
                if @hangman[i] == guess
                    @hangman_code[i] = guess
                end
            end
            return true
        else
            @turns.push(guess)
            puts "its not there unfortunately\n\n" 
            return false
        end
      end

      def check_win
        if @hangman == @hangman_code.join
            return true
        end
      end

      def reveal_code
        p @hangman
      end
    end


  class Game
      def initialize
          puts "\n\nWelcome to Hangman!"
          puts "What's your name?"
          @player = Player.new(gets.chomp)
        #   @player = Player.new("Jack")
          print "\nHey #{@player.name}, lets get started!"
          sleep(0.5)
          print "!"
          sleep(0.5)
          print "!"
          sleep(0.5)
          print "!"
          puts "\n\n"

      end

      def play
            @board = Board.new()
            @game_over = false
            @failed_moves = 0
            @moves = 0
            until @game_over
                @board.display_board(@failed_moves)
                puts "\nChoose a letter to play:\n\n"
                #Get input and check it's valid
                valid_choice = false
                until valid_choice
                    player_guess = gets.chomp.downcase
                    if @board.is_choice_valid(player_guess)     
                        valid_choice = true
                        @moves += 1
                    end
                end
                 if @board.check_code(player_guess) == false
                    @failed_moves += 1
                 end
                 if @board.check_win == true
                    @game_over = true
                    puts "Congratulations!!\n\n"
                    puts "You correclty guessed:"
                    @board.reveal_code
                    puts "\n\nWell done #{@player.name}. Hope to see you again soon!\n\n"
                 end
                 if @failed_moves == 6
                    @board.display_board(@failed_moves)
                    @game_over = true
                    puts "\n\nGame Over..... the word was:"
                    @board.reveal_code
                    puts "\n"
                    puts "Unlucky #{@player.name}, you didn't manage to guess the word and save the guy...   :(\n\n\n"
                 end
            end   
        end
    end



  game = Game.new()
  play_again = ""
  until play_again == "No" || play_again == "no"
      game.play
      puts 'Play again? Type Yes or No'
      play_again = gets.chomp
    until ['Yes', 'No', "yes", "no"].include?(play_again)
      puts 'Invalid input. Type Yes or No'
      play_again = gets.chomp
    end
    if play_again == "Yes" || play_again == "yes"
        print "Great! Lets get you into another game"
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print ".\n\n"
    end
  end
  puts "That's a shame"
  sleep (1)
  puts "\nSee you next time\n\n"
  


# game = Game.new()
# game.play