class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :github_uid, null: false
      t.string :github_username, null: false
      t.string :github_email

      t.timestamps
    end

    add_index :users, :github_uid, unique: true
  end
end
