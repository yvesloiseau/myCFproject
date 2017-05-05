FactoryGirl.define do

  factory :product do
    name "Sun Mountain cart bag SM-100"
    description "This is a product for testing"
    product_type "bag"
    brand "Sun Mountain"
    price 89.99
  end

  factory :comment do
    association :product, :user
    text "Bad bag"
    rating 1
  end


end