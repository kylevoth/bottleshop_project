class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :pst_rate, precision: 12, scale: 3
      t.decimal :gst_rate, precision: 12, scale: 3
      t.decimal :hst_rate, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.references :customer, foreign_key: true
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
