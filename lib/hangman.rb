class Hangman

  @@hangmen = []
  @@easy_words = ["epic", "elephant", "ruby", "sinatra", 'purple']
  @@medium_words = ["penguin"]
  @@hard_words = ["initialize"]

  define_method(:initialize) do |difficulty_level|
    @difficulty = difficulty_level
    if difficulty_level == "easy"
      @word = @@easy_words[rand(@@easy_words.length())]
    elsif difficulty_level == "medium"
      @word = @@medium_words[rand(@@medium_words.length())]
    elsif difficulty_level == "hard"
      @word = @@hard_words[rand(@@hard_words.length())]
    end
    @word_array = @word.split('')
    @hidden_word = '_ '*(@word.length())
    @hidden_word = @hidden_word[0...-1]
    @hidden_word_array = @hidden_word.split(' ')
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
    correct_letter = @word.split('').include?(letter)
    unless correct_letter
      @incorrect_letters.push(letter)
    end
    @word_array.each() do |indexing_letter|
      if indexing_letter == letter
        i = @word_array.index(indexing_letter)
        @hidden_word_array[i] = letter
      end
    end
    @hidden_word = @hidden_word_array.join(' ')

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
