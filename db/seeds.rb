Message.destroy_all

Team.destroy_all

t1 = Team.create :name => "Mr Ape's Truckings Co"
t2 = Team.create :name => "Marx Brothers Ace Team"
t3 = Team.create :name => "General Assembly Students"

puts "USERS!"
User.destroy_all

u1 = User.create :username => "groucho", :name => 'Groucho Marx', :email => 'groucho@ga.co', :password => "chicken", :image => "avatar_jwrxm0", :password_confirmation => "chicken", :team_id => t2.id

u2 = User.create :username => "harpo", :name => 'Harpo Marx', :email => 'harpo@email.com', :password => "chicken", :image => "avatar_jwrxm0", :password_confirmation => "chicken", :team_id => t2.id

u3 = User.create :username => "zeppo", :name => 'Zeppo Marx', :email => 'zeppo@email.com', :password => "chicken", :image => "avatar_jwrxm0", :password_confirmation => "chicken", :team_id => t2.id

u4 = User.create :username => "Mr Ape", :name => 'Daniel Liu', :email => 'ape@email.com', :password => "chicken", :image => "avatar_jwrxm0", :password_confirmation => "chicken", :team_id => t1.id



puts "\tUser count: #{ User.all.count }"




puts "CHATROOMS!"
Chatroom.destroy_all

c1 = Chatroom.create :name => "Random", :user_id => u1.id, :team_id => t1.id
c1.users << u2 << u3

c2 = Chatroom.create :name => "General", :user_id => u2.id, :team_id => t1.id
c2.users << u2 << u3

puts "\tChatroom count: #{ Chatroom.all.count }"
