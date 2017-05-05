FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
#    email "peter@example.com"
#    email "yves.loiseau@videotron.ca"
    password "1234567890"
    first_name "Peter"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email
    password "123456"
    first_name "Yves"
    last_name "Example"
    admin true
  end
end