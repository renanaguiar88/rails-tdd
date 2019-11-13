FactoryBot.define do
  factory :customer do |f|
    f.name {Faker::Name.name}
    f.email {Faker::Internet.email}
  end
end