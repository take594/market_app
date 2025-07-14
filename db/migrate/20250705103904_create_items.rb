class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image
      t.integer :price
      t.string :category
      t.text :introduction
      t.boolean :onSale
      t.integer :interest
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
