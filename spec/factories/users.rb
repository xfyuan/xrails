FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| "xrails#{n}@abc.com" }
    sequence(:firstname)  { |n| "Apple#{n}" }
    sequence(:lastname)   { |n| "Tree#{n}" }
    password              "nopassword"
    password_confirmation "nopassword"
    info '{}'
  end
end
