class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :user
      t.references :book
      t.integer :rating_level

      t.timestamps
    end
  end
end
