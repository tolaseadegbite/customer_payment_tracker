user = User.create!(email: 'tolase@example.com',
                    password: 'foobar',
                    password_confirmation: 'foobar')

user = User.create!(email: 'lashe@example.com',
                    password: 'foobar',
                    password_confirmation: 'foobar')

8.times do |n|
    User.create!(email: Faker::Internet.email, password: 'foobar', password_confirmation: 'foobar')
end

10.times do |n|
    Customer.create!(name: Faker::Name.name, phone_number: Faker::Base.numerify('081########'), user: User.first)
end

