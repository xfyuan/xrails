FactoryGirl.define do
  sequence(:github)  { |n| "http://www.github.com/hero#{n}" }
  sequence(:twitter)  { |n| "ghost#{n}" }

  factory :user do
    sequence(:email)      { |n| "xrails#{n}@abc.com" }
    sequence(:firstname)  { |n| "Apple#{n}" }
    sequence(:lastname)   { |n| "Tree#{n}" }
    password              "nopassword"
    password_confirmation "nopassword"
    info {
      {
        github: generate(:github),
        twitter: generate(:twitter)
      }
    }
  end
end
