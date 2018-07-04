FactoryBot.define do

  factory :user do
    points {rand(1..500)}
  end

end