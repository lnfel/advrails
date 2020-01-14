class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.decimal :price
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end
