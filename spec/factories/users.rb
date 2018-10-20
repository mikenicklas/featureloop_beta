FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "testing123"
    password_confirmation "testing123"

    product
  end
end