class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.string :status
      t.string :comment

      t.timestamps
    end
  end
end
