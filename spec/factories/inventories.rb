FactoryBot.define do
  factory :inventory do
    name { generate(:inventory_name) }
    user { create(:user) }
  end

  sequence :iventory_name do |num|
    "Typing Like a Barbarian #{num}"
  end
end
