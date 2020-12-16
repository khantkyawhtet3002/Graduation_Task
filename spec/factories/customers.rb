FactoryBot.define do
  factory :customer do
    full_name { 'LeeKangMin' }
    display_name { 'KangMin' }
    email { 'kangmin11@gmail.com' }
    password { 'password' }
    icon { nil }
    score { 40 }
    residence { 'Seoul' }
  end
end
