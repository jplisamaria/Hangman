#### DECLARATIONS ####
word_string = "test"
word = word_string.split(//)
letters_guessed = []
ALLOWED_GUESSES = 6
remaining_guesses = ALLOWED_GUESSES

#### METHODS ####
def print_word_in_progress(word, letters_guessed)
  word.each do |letter|
    if letters_guessed.include? letter
      print "#{letter} "
    else print "_ "
    end
  end
end

#### HEADER ####
system "clear"
puts
intro = "This is LAME HANGMAN...the awesomest hangman you've every played."
puts "*" * intro.length
puts intro
puts "Enter your guess one letter a time."
puts "*" * intro.length
3.times {puts}

#### MAIN PROGRAM ####
while remaining_guesses > 0
  puts "*" * (0.66 * intro.length)
  puts "#{remaining_guesses} guesses left."
  print "You've guessed the following letters: "
  letters_guessed.uniq.sort.each do |letter|
    print "#{letter}  "
  end 
  3.times {puts}
  print_word_in_progress(word, letters_guessed)
  2.times {puts}
  
  print "What's your guess?\n> "
  guess = gets.strip.downcase
  3.times {puts}
#  system "clear"

  if word.include? guess
    letters_guessed << guess
#    puts
    puts "Good guess."

    if word.uniq - letters_guessed == []
      2.times {puts}
      puts "You win!  The word was '#{word_string}'."
      puts "Contratulations.   WOO HOO!!!!"
      2.times {puts}
      remaining_guesses = 0
    end

  else
 #   puts
    puts "Wrong."
    unless letters_guessed.include? guess
      letters_guessed << guess
      remaining_guesses = remaining_guesses - 1
      if remaining_guesses == 0 
        puts "Sorry, the word was '#{word_string}'."
      end
    end
  end
end

