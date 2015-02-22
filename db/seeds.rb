channel = Channel.new
channel.name = "BEWD"
channel.save
channel = Channel.new
channel.name = "ACAD"
channel.save


for i in 1 .. 1000
  unless (user = User.find_by_username(Faker::Internet.user_name))
    user = User.new
    user.username = Faker::Internet.user_name
    user.street = Faker::Address.street_address
    user.city = Faker::Address.city
    user.zip = Faker::Address.zip
    user.state = Faker::Address.state_abbr
    user.email = Faker::Internet.email(user.username)
    Faker::Config.locale = 'en-US'
    user.phone = Faker::PhoneNumber.phone_number
    if user.save != true
      puts "Error with user:"
      puts user.errors.full_messages
      puts user.id
      puts user.username
      puts user.street
      puts user.city
      puts user.zip
      puts user.state
      puts user.email

    end
  end
  cid = i % 2 +1
  unless (membership = Membership.find_by_user_id_and_channel_id(user.id,cid))
     membership = Membership.new
     membership.channel_id = cid
     membership.user_id = user.id
     if membership.save != true
       puts "Error with membership:"
       puts membership.errors.full_messages
     end
  end

  message = Message.new
  message.message = Faker::Lorem.sentence
  message.membership_id= membership.id
  if message.save != true
    puts "Error with message:"
    puts message.errors.full_messages
  end
end
