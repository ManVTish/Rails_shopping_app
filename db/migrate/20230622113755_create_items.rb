class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.integer :amount
      t.string :product_id
      t.references :itemable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
