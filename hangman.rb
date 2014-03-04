class Hangman
  attr_reader :words
  attr_reader :word
  attr_reader :remaining_guesses
  attr_reader :guesses
  attr_reader :guess
  ALLOWED_GUESSES = 6

  def initialize(filename)
    @words = IO.readlines(filename)
    @remaining_guesses = ALLOWED_GUESSES
    @guesses = []
    @guess = ""
    @word = []
  end

  def play
    print_header
    @word = words.sample.strip.split(//)
    while remaining_guesses > 0
      get_guess
      process_guess
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
    blank_lines(3)
  end

  def get_guess
    puts "#{remaining_guesses} guesses left."
    print "You've guessed the following letters: "
    guesses.uniq.sort.each { |letter| print "#{letter}  "} 
    blank_lines(3)
    print_word_in_progress
    blank_lines(3)
    print "What's your guess?\n> "
    @guess = gets.strip.downcase
  end

  def print_word_in_progress
    word.each do |letter|
      if (guesses.include? letter.to_s) 
        print "#{letter.to_s} "
      else 
        print "_ "
      end
    end
  end

  def process_guess
    if word.include? guess
      guesses << guess
      blank_lines(3)
      puts "Good guess."
      puts "*" * 40

      if win?
        blank_lines(2)
        puts "You win!  The word was '#{word.join}'."
        puts "Congratulations.   WOO HOO!!!!"
        blank_lines(2)
        @remaining_guesses = 0
      end

    else
      blank_lines(3)
      puts "Wrong."
      puts "*" * 40
      unless guesses.include? guess
        guesses << guess
        @remaining_guesses -= 1
        if lose?
          blank_lines(2)
          puts "Sorry, the word was '#{word.join}'."
          blank_lines(2)
        end
      end
    end
  end

  def win?
    word.uniq - guesses == []
  end

  def lose?
    remaining_guesses == 0
  end

  def blank_lines(lines)
    lines.times {puts}
  end
end



hangman = Hangman.new("words.txt")
hangman.play