FactoryBot.define do
  factory :card do
    name { generate :card_name }
    price "3.45"
    image_url "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=19737&type=card"
  end

  sequence :card_name do |n|
    "Food Chain #{n}"
  end
end
