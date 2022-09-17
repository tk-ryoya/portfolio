FactoryBot.define do
  factory :reservation do
    reservation_type { 0 }
    reservation_datetime { Time.current }
    delete_flag { false }
    association :user
  end
end
