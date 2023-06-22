class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.string :status, default: "started"
      t.string :comment, default: "order placed"

      t.timestamps
    end
  end
end
