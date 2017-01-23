Team.destroy_all

t1 = Team.create :name => "Mr Ape's Truckings Co"
t2 = Team.create :name => "Marx Brothers Ace Team"

puts "USERS!"
User.destroy_all

u1 = User.create :username => "groucho", :name => 'Groucho Marx', :email => 'groucho@ga.co', :password => "chicken", :password_confirmation => "chicken", :team_id => t1.id

u2 = User.create :username => "harpo", :name => 'Harpo Marx', :email => 'kristina@email.com', :password => "chicken", :password_confirmation => "chicken", :team_id => t1.id

u3 = User.create :username => "zeppo", :name => 'Zeppo Marx', :email => 'josephs@email.com', :password => "chicken", :password_confirmation => "chicken", :team_id => t2.id


puts "\tUser count: #{ User.all.count }"




puts "CHATROOMS!"
Chatroom.destroy_all

c1 = Chatroom.create :name => "Random", :user_id => u1.id, :team_id => t1.id
c1.users << u2 << u3

c2 = Chatroom.create :name => "General", :user_id => u2.id, :team_id => t1.id
c2.users << u2 << u3

puts "\tChatroom count: #{ Chatroom.all.count }"
