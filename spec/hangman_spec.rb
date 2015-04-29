require 'rspec'
require 'hangman'

describe('Hangman') do
  describe('#word') do
    it("will return the current hangman word") do
      test_hangman = Hangman.new()
      expect(test_hangman.word()).to(eq('epic'))
    end
  end
end
