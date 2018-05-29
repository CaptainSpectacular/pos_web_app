FactoryBot.define do
  factory :card do
    name { generate :name } 
    image_url "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=19737&type=card"
    condition_id 18844
  end

  sequence :name do |n|
    "Food Chain #{n}"
  end
end
