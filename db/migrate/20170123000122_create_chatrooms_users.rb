class CreateChatroomsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms_users, id: false do |t|
      t.integer :chatroom_id
      t.integer :user_id
    end
  end
end

# rails generate migration create_chatrooms_users
