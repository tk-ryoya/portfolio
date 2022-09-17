FactoryBot.define do
  factory :first_interview do
    injury_date { Date.current }
    injury_position { 0 }
    description { "test_description" }
  end
end
