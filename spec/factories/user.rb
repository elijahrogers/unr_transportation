FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    email 'johndoe@test.com'
    password 'password'
  end

  factory :invalid_user, parent: :user do
    password nil
  end

  factory :activated_user, parent: :user do
    activated true
  end
end
