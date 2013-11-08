# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drawing_history do
    drawing_id 1
    status "MyString"
    notes "MyString"
  end
end
