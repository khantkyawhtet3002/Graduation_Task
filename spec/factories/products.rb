FactoryBot.define do
  factory :product do
    name { 'Product 1' }
    price { '15000Ks' }
    image { nil }
    season { '20ss' }
    maker
  end
end
 
