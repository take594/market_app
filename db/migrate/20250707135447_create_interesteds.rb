class CreateInteresteds < ActiveRecord::Migration[6.1]
  def change
    create_table :interesteds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
