FactoryBot.define do
  factory :reservation do
    user { nil }
    reservation_type { 1 }
    reservation_datetime { "2022-08-23 13:47:49" }
    delete_flag { false }
  end
end
