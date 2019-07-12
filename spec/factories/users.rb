FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "TEST_USERNAME#{n}" }
    sequence(:nickname) { |n| "TEST_NICKNAME#{n}" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    sequence(:password) { |n| "TEST_PASS#{n}" }
    sequence(:password_comfirmation) { |n| "TEST_PASS#{n}" }
  end
end
