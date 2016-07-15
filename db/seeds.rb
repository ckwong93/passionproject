require 'faker'

20.times do
	User.create(username: Faker::Internet.domain_word,
	email: Faker::Internet.email,
	password_hash: Faker::Internet.password(3))
end