FactoryBot.define do
  factory :user do
    username { generate(:username) }    
    email    'definitely_smashmouth@org.com' 
    password 'ezpzpassword' 
  end
end
