require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The hangman app path') do
  it("Take a letter input and if correct add that letter to the word, if not add it to incorrect letter and build hangman") do
    visit('/')
    fill_in('letter_checker', :with => 'e')
    click_button('check_letter')
    expect(page).to have_content('e _ _ _')
  end
end
