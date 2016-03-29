FactoryGirl.define do
  factory :item do
    name RandomData.random_sentence
    user
  end
end