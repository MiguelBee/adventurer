FactoryBot.define do
	factory :user do
		sequence :email do |n|
			"fakeEmail#{n}@gmail.com"
		end
		first_name "Miguel"
  	last_name "Bustamante"
  	quote "I die a little every day"
  	birthday {36.years.ago}
  	password "secret"
		password_confirmation "secret"
	end
end