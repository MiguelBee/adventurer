require 'date'

FactoryBot.define do
  factory :subscription do
    user_id 1
  end
  factory :vote do
  end

  factory :adventure do
    title { 'This is the adventure we took' }
    description { 'We went to the hjmilayas' }
    str_date { 1.year.ago }
    end_date { Date.today }
    user_id { :user }
  end

  factory :user do
    sequence :email do |n|
      "fakeEmail#{n}@gmail.com"
    end
    sequence :username do |u|
      "username#{u}"
    end
    first_name { 'Miguel' }
    last_name { 'Bustamante' }
    adventurer_type { 'Moto Trekker' }
    quote { 'I die a little every day' }
    about { "I'm from chicago, but live in colorado" }
    birthday { 36.years.ago }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
