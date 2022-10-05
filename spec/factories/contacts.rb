FactoryBot.define do
  factory :contact do
    name { "滋賀 琵琶子" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    content { "不具合について" }
  end
end
