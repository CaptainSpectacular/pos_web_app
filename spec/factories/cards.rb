FactoryBot.define do
  factory :card do
    name { generate :name } 
    condition_id 18844
  end

  sequence :name do |n|
    "Food Chain #{n}"
  end
end
