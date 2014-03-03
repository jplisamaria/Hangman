#### DECLARATIONS ####
words = []
words = IO.readlines("words.txt")
word_string = words.sample.strip #try "don't"
word = word_string.split(//)
guesses = []
ALLOWED_GUESSES = 6
remaining_guesses = ALLOWED_GUESSES

#### METHODS ####
def print_word_in_progress(word, guesses)
#  lower_case_alphabet = ("a".."z").to_a
  word.each do |letter|
    if (guesses.include? letter) #or (!lower_case_alphabet.include? letter)
      print "#{letter} "
    else 
      print "_ "
    end
  end
end

#### HEADER ####
intro = "This is LAME HANGMAN...the awesomest hangman you've every played."
long_bar = "*" * intro.length 
short_bar = "*" * (0.66 * intro.length)
puts long_bar
puts intro
puts "Enter your guess one letter a time."
puts long_bar
3.times {puts}

#### MAIN PROGRAM ####
while remaining_guesses > 0
  puts short_bar
  puts "#{remaining_guesses} guesses left."
  print "You've guessed the following letters: "
  guesses.uniq.sort.each { |letter| print "#{letter}  "} 
  3.times {puts}
  print_word_in_progress(word, guesses)
  2.times {puts}
  
  print "What's your guess?\n> "
  guess = gets.strip.downcase
  3.times {puts}

  if word.include? guess
    guesses << guess
    puts "Good guess."

    if (word.uniq - guesses == []) # (or word.uniq - guesses
                                      #  has non-lowercase letters)
      2.times {puts}
      puts "You win!  The word was '#{word_string}'."
      puts "Contratulations.   WOO HOO!!!!"
      2.times {puts}
      remaining_guesses = 0
    end

  else
    puts "Wrong."
    unless guesses.include? guess
      guesses << guess
      remaining_guesses = remaining_guesses - 1
      if remaining_guesses == 0 
        puts "Sorry, the word was '#{word_string}'."
      end
    end
  end
end

