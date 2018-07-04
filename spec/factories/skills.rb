FactoryBot.define do

  sequence(:name) { |n| "Skill name #{n}" }

  factory :skill do
    name

    trait :parent do
      children { |child| [child.association(:skill)] }
    end

  end

end