require 'rspec'
require 'hangman'

describe('Hangman') do
  describe('#word') do
    it("will return the current hangman word") do
      test_hangman = Hangman.new()
      expect(test_hangman.word()).to(eq('epic'))
    end
  end

  describe('#check_letter') do
    it("adds the letter to incorrect_letters if the letter isn't in the word") do
      test_hangman = Hangman.new()
      test_hangman.check_letter('a')
      expect(test_hangman.incorrect_letters()).to(eq(['a']))
    end

    it("changes displayed word if the letter is correct") do
      test_hangman = Hangman.new()
      test_hangman.check_letter('e')
      expect(test_hangman.hidden_word()).to(eq('e _ _ _'))
    end
  end
end
