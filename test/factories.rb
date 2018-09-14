FactoryBot.define do
  factory :post do
    
  end
  factory :adventure do
    
  end
	factory :user do
		sequence :email do |n|
			"fakeEmail#{n}@gmail.com"
		end
		sequence :username do |u|
			"username#{u}"
		end
		first_name "Miguel"
  	last_name "Bustamante"
  	quote "I die a little every day"
  	about "I'm from chicago, but live in colorado"
  	birthday {36.years.ago}
  	password "secret"
		password_confirmation "secret"
	end
end