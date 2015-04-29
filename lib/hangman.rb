class Hangman

  @@hangmen = []
  @@words = ["epic"]

  define_method(:initialize) do
    @word = @@words[rand(@@words.length())]
    @hidden_word = '_ '*(@word.length())
    @hidden_word = @hidden_word[0...-1]

    # @incorrect_letters = []
  end

  define_method(:word) do
    @word
  end

  define_method(:hidden_word) do
    @hidden_word
  end

end
