require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario 'Shows the welcome message' do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end
