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

  scenario 'Show a Customer' do
    customer = create(:customer) 
    
    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end

  scenario 'Show a Customers index' do
    customer_one = create(:customer) 

    customer_two = create(:customer) 
    
    visit(customers_path)
    expect(page).to have_content(customer_one.name).and have_content(customer_two.name)    
  end

  scenario 'Update a Customer' do
    customer = create(:customer)
    
    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in('customer_name', with: new_name)
    click_on('Update Customer')

    expect(page).to have_content('Customer updated successfully')
    expect(page).to have_content(new_name)
  end
  
  scenario 'Click on Show Link from Index' do
    customer = create(:customer)    
    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr/td[2]/a').click
    expect(page).to have_content('Customer Show')
  end 

  scenario 'Click on Edit Link from Index' do
    customer = create(:customer)    
    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr/td[3]/a').click
    expect(page).to have_content('Customer Edit')
  end 

  scenario 'Delete a Customer', js: true do
    customer = create(:customer) 
    visit(customers_path)    
    find(:xpath, '/html/body/table/tbody/tr/td[4]/a').click
    1.second
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Customer deleted successfully')
  end
end