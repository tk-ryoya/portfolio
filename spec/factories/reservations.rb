FactoryBot.define do
  factory :reservation do
    reservation_type { 0 }
    reservation_date { Time.current }
    reservation_time { Time.current }
    start_time { Time.current }
    association :user
  end
end
