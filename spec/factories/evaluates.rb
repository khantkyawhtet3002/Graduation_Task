FactoryBot.define do
  factory :evaluate do
    rate { '3.5' }
    image { nil }
    content { 'Impressions of the evaluation created by the factory bot' }
    product
    customer
  end
end
