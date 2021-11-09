class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :completed
      t.integer :price

      t.timestamps
    end
  end
end
