class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :place
      t.string :image
      t.text :about
      t.integer :user_id

      t.timestamps
    end
  end
end
