FactoryBot.define do
  factory :clock_in do
    trait :wake_up do
      way { "wake_up" }
    end

    trait :sleep do
      way { "sleep" }
    end
  end
end
