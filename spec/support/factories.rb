FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret123"
    password_confirmation "secret123"
  end
end