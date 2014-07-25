# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_email do
    user_id ""
    email "MyString"
    verified false
  end
end
