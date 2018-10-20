FactoryBot.define do
  factory :product do
    name "Google"
    sequence :subdomain do |n|
      "prdouct#{n}"
    end
  end
end