class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :category
      t.references :author
      t.string :name
      t.integer :publish_year
      t.float :default_price
      t.float :promotion_price
      t.text :content

      t.timestamps
    end
  end
end
