require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require('./lib/hangman')

get('/') do
  erb(:index)
end

post('/letter_check') do
  @hangman = Hangman.all()[0]
  @hangman.check_letter(params.fetch('letter_checker'))
  erb(:game)
end

post('/difficulty/:level') do
  Hangman.clear()
  @hangman = Hangman.new(params.fetch('level'))
  @hangman.save()
  erb(:game)
end
