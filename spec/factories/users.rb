FactoryGirl.define do
  factory :user do
    sequence(:email)     { |n| "xrails#{n}@abc.com" }
    sequence(:firstname) { |n| "Apple#{n}" }
    sequence(:lastname)  { |n| "Tree#{n}" }
    password             'nopassword123'
    password_confirmation 'nopassword123'
    authentication_token 'authentication_token'
    info '{}'
  end
end
