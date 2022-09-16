FactoryBot.define do
  factory :user do
    last_name { "滋賀" }
    first_name { "琵琶子" }
    last_name_kana { "シガ" }
    first_name_kana { "ビワコ" }
    tel { "12345678910" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
