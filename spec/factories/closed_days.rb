FactoryBot.define do
  factory :closed_day do
    date { "2023-02-24" }
    closed_days { false }
    closed_days_pm { false }
  end
end
