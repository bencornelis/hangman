class Hangman

  @@hangmen = []
  @@words = {
              "easy" => ["epic", "elephant", "ruby", "sinatra", 'purple'],
              "medium" => ["penguin"],
              "hard" => ["initialize"]
              }

  define_method(:initialize) do |difficulty_level|
    @word = @@words.fetch(difficulty_level).sample()
    @difficulty = difficulty_level
    @hidden_word = '_ '*@word.length()
    @incorrect_letters = []
  end

  define_method(:word) do
    @word
  end

  define_method(:difficulty) do
    @difficulty
  end

  define_method(:number_incorrect) do
    @incorrect_letters.length()
  end

  define_method(:hidden_word) do
    @hidden_word
  end

  define_method(:incorrect_letters) do
    @incorrect_letters
  end

  define_method(:check_letter) do |letter|
    correct_letter = false
    split_hidden_word = @hidden_word.split(' ')

    for i in 0...@word.length()
      if @word[i] == letter
          split_hidden_word[i] = letter
          correct_letter = true
      end
    end

    if correct_letter
      @hidden_word = split_hidden_word.join(' ')
    else
      @incorrect_letters.push(letter)
    end
  end

  define_method(:save) do
    @@hangmen.push(self)
  end

  define_singleton_method(:all) do
    @@hangmen
  end

  define_singleton_method(:clear) do
    @@hangmen = []
  end

end
