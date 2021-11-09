class CreateBookCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :book_carts do |t|
      t.references :book, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
