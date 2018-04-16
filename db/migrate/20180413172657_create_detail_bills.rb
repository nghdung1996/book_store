class CreateDetailBills < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_bills do |t|
      t.references :bill
      t.references :book
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
