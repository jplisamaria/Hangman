class Hangman
  attr_reader :words
  attr_reader :word
  attr_accessor :remaining_guesses
  attr_reader :guesses
  attr_reader :guess
  ALLOWED_GUESSES = 6
  def initialize(filename)
    @words = IO.readlines(filename)
    @remaining_guesses = ALLOWED_GUESSES
    @guesses = []
    @guess = ""
    @word = words.sample.strip.split(//)
  end

  def play
    print_header
    #    get_word
    #puts @word.join
    #puts "#{@remaining_guesses}  @remaining_guesses 1 in play"
    while @remaining_guesses > 0
      #puts "#{@remaining_guesses} remaining guesses 2 in play"

      guess = prompt_for_guess
      #puts "#{@remaining_guesses} remaining guesses 3 in play"

      #puts "#{guess} guess 1 in play"
      process_guess(guess, @remaining_guesses)
    end
  end

  private
  def print_header
    intro = "This is LAME HANGMAN...the awesomest hangman you've every played."
    bar = "*" * intro.length 
    instructions = "Enter your guess one letter a time."
    puts bar
    puts intro
    puts instructions
    puts bar
    3.times {puts}
  end

  #  def get_word
  #    @word = words.sample.strip.split(//)
  #    puts word
  #  end

  def prompt_for_guess
    puts "*" * 40
    puts "#{@remaining_guesses} guesses left."
    #puts "#{guesses} guesses 1 in prompt_for_guess"
    print "You've guessed the following letters: "
    guesses.uniq.sort.each { |letter| print "#{letter}  "} 
    3.times {puts}
    print_word_in_progress(word, guesses)
    2.times {puts}
    print "What's your guess?\n> "
    guess = gets.strip.downcase
    return guess
    3.times {puts}
  end

  def print_word_in_progress(word, guesses)
    #puts "#{guesses} guesses 1 in print_word_in_progress"
    word.each do |letter|
      if (guesses.include? letter.to_s) 
        print "#{letter.to_s} "
      else 
        print "_ "
      end
    end
  end

  def process_guess(guess, remaining_guesses)
    if word.include? guess
      #puts "#{guess} guess 1 in process_guess"
      guesses << guess
      #puts "#{guesses} guesses 1 process_guess"
      puts "Good guess."
      #puts "#{@remaining_guesses} @remaining_guesses 1 in process_guess"

      if (word.uniq - guesses == []) 
        2.times {puts}
        puts "You win!  The word was '#{word.join}'."
        puts "Contratulations.   WOO HOO!!!!"
        2.times {puts}
        @remaining_guesses = 0
      end

    else
      #puts "#{@remaining_guesses} remaining guesses"
      puts "Wrong."
      unless guesses.include? guess
        guesses << guess
        @remaining_guesses -= 1
        puts "#{@remaining_guesses} remaining guesses"

        if @remaining_guesses == 0 
          puts "Sorry, the word was '#{word.join}'."
        end
      end
    end
  end
end

#### MAIN PROGRAM ####
hangman = Hangman.new("words.txt")
hangman.play