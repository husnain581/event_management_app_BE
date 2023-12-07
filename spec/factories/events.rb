FactoryBot.define do
    factory :event do
      name { Faker::Lorem.sentence.slice(0, 15) }
      description { Faker::Lorem.paragraph }
      date { Faker::Time.forward(days: 30, period: :all) }
      location { Faker::Address.city }
      association :organizer, factory: :user
  
      factory :event_with_users do
        transient do
          users_count { 5 }
        end

        after(:create) do |event, evaluator|
          create_list(:user, evaluator.users_count, events: [event])
        end
      end
    end
end
