FactoryBot.define do
  factory :maker do
    name { 'KKH OS' }
    email { 'khantkyawhtet@gmail.com' }
    password { 'password' }
    site_url { 'https://maker1.com' }
    logo { nil }
    image { nil }
    ivent { 'Manufacturer 1 Event Notice' }
  end
end
