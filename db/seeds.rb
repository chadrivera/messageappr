for i in 1 .. 1000
  message = Message.new
  message.username = Faker::Internet.user_name
  message.message = Faker::Lorem.sentence
  message.street = Faker::Address.street_address
  message.city = Faker::Address.city
  message.zip = Faker::Address.zip
  message.state = Faker::Address.state_abbr
  message.email = Faker::Internet.email(message.username)
  Faker::Config.locale = 'en-US'
  message.phone = Faker::PhoneNumber.phone_number
  if message.save != true
    puts "Error with message:"
    puts message.errors.full_messages
    puts message.phone
  end
end
