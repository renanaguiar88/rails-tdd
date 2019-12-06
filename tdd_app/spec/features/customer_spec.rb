require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario 'Verify Customer Register link' do
    visit(root_path)
    expect(page).to have_link('Customer Register')    
  end

  scenario 'Verify New Customer link' do
    visit(root_path)    
    click_on('Customer Register')
    expect(page).to have_content('Customer List')
    expect(page).to have_link('New Customer')
  end

  scenario 'Verify New Customer form' do
    visit(customers_path)
    click_on('New Customer')
    expect(page).to have_content('New Customer')
  end
end
