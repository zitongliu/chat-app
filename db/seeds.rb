# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "USERS!"
User.destroy_all

u1 = User.create :username => "groucho", :name => 'Groucho Marx', :email => 'groucho@ga.co', :password => "chicken", :password_confirmation => "chicken"

u2 = User.create :username => "harpo", :name => 'Harpo Marx', :email => 'kristina@email.com', :password => "chicken", :password_confirmation => "chicken"

u3 = User.create :username => "zeppo", :name => 'Zeppo Marx', :email => 'josephs@email.com', :password => "chicken", :password_confirmation => "chicken"


puts "\tUser count: #{ User.all.count }"


puts "CHATROOMS!"
Chatroom.destroy_all

c1 = Chatroom.create :name => "Random", :user_id => u1.id
c1.users << u2 << u3

c2 = Chatroom.create :name => "General", :user_id => u2.id
c2.users << u2 << u3

puts "\tChatroom count: #{ Chatroom.all.count }"
