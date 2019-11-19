class Customer < ApplicationRecord
  has_many :orders
  
  def full_name
    "Mr(s) #{name}"
  end
end
