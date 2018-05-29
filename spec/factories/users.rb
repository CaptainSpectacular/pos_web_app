FactoryBot.define do
  factory :user do
    email    { generate(:email) }
    password 'ezpzpassword'
  end

  sequence :email do |num|
    "definitely_smashmouth_#{num}@example.com"
  end
end
