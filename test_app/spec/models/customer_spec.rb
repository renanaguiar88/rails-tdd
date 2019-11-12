require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  it 'Create a customer' do
    customer = customers(:ruby_on_rails)
    expect(customer.full_name).to eq("Mr(s) Ruby on Rails")
  end
end
