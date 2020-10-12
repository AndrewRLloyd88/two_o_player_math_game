class Question
  attr_reader :nextQuestion, :nextAnswer

  #generate the number between 1 and 20 to sum together for player questions
  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    #pop the question
    @nextQuestion = "What does #{num1} plus #{num2} equal?"
    #answer to hold our sum total of num 1 and num 2
    @nextAnswer = num1 + num2
  end
end