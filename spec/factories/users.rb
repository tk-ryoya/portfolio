FactoryBot.define do
  factory :user do
    last_name { "草津" }
    first_name { "太郎" }
    last_name_kana { "クサツ" }
    first_name_kana { "タロウ" }
    tel { "12345678910" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
