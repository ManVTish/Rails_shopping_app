class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.bigint :user_id
      t.bigint :product_id

      t.timestamps
    end
  end
end
