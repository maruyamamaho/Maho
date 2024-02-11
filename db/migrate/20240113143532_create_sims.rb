class CreateSims < ActiveRecord::Migration[6.1]
  def change
    create_table :sims do |t|
      t.string :career
      t.text :review
      t.integer :star
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
