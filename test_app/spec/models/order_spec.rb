require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do    
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Have three orders - create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    # customer = create(:customer, :with_orders, orders_count: 3)
    # customer = create(:customer, :with_orders)
    customer = create(:customer_with_orders)
    customer_with_orders
    puts customer.inspect
    puts customer.orders.inspect
    expect(customer.orders.count).to eq(3)
  end
end
