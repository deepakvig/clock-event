FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    sequence(:name) { |n| "test-#{n.to_s.rjust(3, "0")}" }
  end
end
