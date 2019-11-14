require 'rails_helper'

RSpec.describe Customer, type: :model do  
  it '#full_name' do
    # customer = create(:customer) 
    customer = create(:user) 
    expect(customer.full_name).to start_with("Mr(s)")    
  end

  it '#full_name (attribute override)' do
    customer = create(:customer, name: "Ruby on Rails")
    expect(customer.full_name).to eq("Mr(s) Ruby on Rails")    
  end

  it 'Inheritance' do
    customer = create(:customer_default)
    expect(customer.vip).to be_falsey   
  end

  it '#attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Mr(s)")    
  end

  it 'Transient attribute' do
    customer = create(:customer_default, upcased: true)
    puts attributes_for(:customer_default) 
    expect(customer.name.upcase).to eq(customer.name)
  end

  it {expect{create(:customer)}.to change {Customer.all.size}.by(1)}
end
