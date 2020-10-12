require './player.rb'
require './question.rb'

#Game class kicks off the game and sets players name
class Game
  def initialize
    puts "What is player 1's name?"
    player1 = gets.chomp
    @player1 = Player.new(player1)
    puts "What is player 2's name?"
    player2 = gets.chomp
    @player2 = Player.new(player2)
  end

#this will continue to generate questions for the next player
  def generateQuestion
    @nextQuestion = Question.new
    puts "----- NEW TURN -----"
    if @player1.turn
      #refactor outputs
      puts "#{@player2.name}: #{@nextQuestion.nextQuestion}"  
    else 
      puts "#{@player1.name}: #{@nextQuestion.nextQuestion}"  
    end
  end

  def checkAnswer
    #we must check if player 1 or player 2 is correct
    if gets.chomp.to_i == @nextQuestion.nextAnswer
      if @player1.turn
        puts "YES! You are correct."
        @player1.turn = false
        @player2.turn = true
        #output stats to screen (refactor)
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        #check lives after each block
        checkWinner
      else
        puts "YES! You are correct."
        @player1.turn = true
        @player2.turn = false
        #output stats to screen (refactor)
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        #check lives after each block
        checkWinner
      end
      #otherwise we need to see which player is playing and subtract if incorrect
    else
      if @player1.turn
        @player1.lives -= 1
        puts "No! You are incorrect."
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        #check lives after each block
        checkWinner
      else
        @player2.lives -= 1
        puts "No! You are incorrect."
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        #check lives after each block
        checkWinner
      end    
    end
  end
#check if a player is a winner e.g. P1 or P2 lives === 0
  def checkWinner
    if @player1.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3 "
      puts "Thank you, play again"
    elsif @player2.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3 "
      puts "Thank you, play again"
    else
      nextTurn
    end
  end

  #logic for progressing the game
  def nextTurn
    generateQuestion
    checkAnswer
  end
end