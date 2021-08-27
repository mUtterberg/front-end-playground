FactoryBot.define do
  factory :producer do
    # Use sequence to make sure that the value is unique
    sequence(:name) { |n| "sample-producer-#{n}"}
  end

  factory :distillery do
    sequence(:name) { |n| "sample-distillery-${n}"}
  end
end
