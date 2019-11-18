FactoryBot.define do
  factory :order do
    sequence(:description) {|n| "Pedido número - #{n}"}
    # if needs override, can use:
    # association :customer, factory: :customer
    customer
  end
end
