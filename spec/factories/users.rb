FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :name do |n|
    "person#{n}"
  end
end

FactoryGirl.define do
  factory :client_user, :class => 'User' do
    email
    password '12345678'
    password_confirmation '12345678'
    name
  end
end