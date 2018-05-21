FactoryBot.define do
  factory :card do
    name { generate :name } 
    price "3.45"
    image_url "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=19737&type=card"
  end

  sequence :name do |n|
    "Food Chain #{n}"
  end
end
