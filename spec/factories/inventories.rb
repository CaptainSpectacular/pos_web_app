FactoryBot.define do
  factory :inventory do
    name { generate(:inventory_name) }
    user { create(:user) }
  end

  sequence :inventory_name do |num|
    "Typing_Like_a_Barbarian #{num}"
  end
end
