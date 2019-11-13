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

  it {expect{create(:customer)}.to change {Customer.all.size}.by(1)}
end
