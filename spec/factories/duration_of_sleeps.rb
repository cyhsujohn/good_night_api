FactoryBot.define do
  factory :duration_of_sleep do
    date { Date.today }
    duration { 3600 }
  end
end
