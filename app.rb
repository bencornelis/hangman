require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require('./lib/hangman')

get('/') do
  Hangman.clear()
  @hangman = Hangman.new()
  @hangman.save()
  erb(:index)
end

post('/letter_check') do
  @hangman = Hangman.all()[0]
  @hangman.check_letter(params.fetch('letter_checker'))
  erb(:index)
end
