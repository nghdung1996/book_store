class CreateOrderers < ActiveRecord::Migration[5.1]
  def change
    create_table :orderers do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.text :note

      t.timestamps
    end
  end
end
