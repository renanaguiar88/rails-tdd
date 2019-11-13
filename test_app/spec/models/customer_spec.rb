require 'rails_helper'

RSpec.describe Customer, type: :model do  
  it 'Create a customer' do
    customer = create(:customer)
    expect(customer.full_name).to eq("Mr(s) Ruby on Rails")
  end
end
