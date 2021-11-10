class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      # column called user_id
      # call reviewer_id
      t.references :reviewer, null: false, foreign_key: {to_table: :users}
      # column called user_id
      # call reviewee_id
      t.references :reviewee, null: false, foreign_key: {to_table: :users}
      t.integer :score

      t.timestamps
    end
  end
end
