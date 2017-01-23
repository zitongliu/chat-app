class AddForeignKeysToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :team_id, :integer
  end
end
