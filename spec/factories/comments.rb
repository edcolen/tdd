FactoryBot.define do
  factory :comment do
    association :post
    body { Faker::Lorem.paragraph }
  end
end
