require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario 'Shows the welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome')
  end

  scenario 'Verify Customer Register link' do
    visit(root_path)
    expect(find('ul li')).to have_link('Customer Register')
  end
end
