FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@com" }
    sequence(:password) { |n| "pass#{n}" }

    to_create(&:save)
  end
end
