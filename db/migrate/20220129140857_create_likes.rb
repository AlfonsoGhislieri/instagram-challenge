class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.string :likeable_type
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :likes, [:likeable_id, :likeable_type]
  end
end
