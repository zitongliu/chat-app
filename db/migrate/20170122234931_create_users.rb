class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.text :password_digest
      t.integer :team_id

      t.timestamps
    end
  end
end
