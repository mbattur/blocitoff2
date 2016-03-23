include RandomData

FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
    confirmed_at Time.now

    factory :admin do
      role :admin
    end
  end
end