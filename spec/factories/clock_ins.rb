FactoryBot.define do
  factory :clock_in do
    trait :wake_up do
      action { "wake_up" }
    end

    trait :sleep do
      action { "sleep" }
    end
  end
end
