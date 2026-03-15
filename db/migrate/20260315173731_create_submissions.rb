class CreateSubmissions < ActiveRecord::Migration[8.1]
  def change
    create_table :submissions do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :line1, null: false
      t.string :line2, null: false
      t.string :line3, null: false
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :submissions, :discarded_at
  end
end
