class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.references :orderer
      t.references :user
      t.string :date_order
      t.float :total_price
      t.integer :payment_type

      t.timestamps
    end
  end
end
