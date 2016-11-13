FactoryGirl.define do
  factory :course do
    building_id 67
    name 'First Class'
    user
  end

  factory :invalid_course, parent: :course do
    name nil
  end
end
