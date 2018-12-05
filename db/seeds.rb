# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adventurer_types = ['Moto Trekker', 'Backpacker', 'Boater', 'RV-er/Road Tripper', 'Bicycler']

50.times do
	user = User.new(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		birthday: Faker::Date.birthday(18, 65),
		quote: Faker::MostInterestingManInTheWorld.quote,
		about: Faker::Lorem.paragraph, 
		username: Faker::Internet.username,
		email: Faker::Internet.email,
		adventurer_type: adventurer_types.shuffle.pop,
		password: 'password',
		password_confirmation: 'password'
	)
	#user.skip_confirmation
	user.save!
	
end