class Customer < ApplicationRecord
  def full_name
    "Mr(s) #{name}"
  end
end
