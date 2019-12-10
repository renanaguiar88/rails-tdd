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

  scenario 'Register a valid Customer' do
    visit(new_customer_path)
    customer_name = Faker::Name.name
    fill_in('customer_name', with: customer_name)
    fill_in('customer_email', with: Faker::Internet.email)
    fill_in('customer_phone', with: Faker::PhoneNumber.phone_number)
    attach_file('customer_avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['Y', 'N'].sample)
    click_on('Create Customer') 
    
    expect(page).to have_content('Customer created successfully')
    expect(Customer.last.name).to eq(customer_name)
  end

  scenario 'Do not register a invalid Customer' do
    visit(new_customer_path)
    click_on('Create Customer')
    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
  
end
