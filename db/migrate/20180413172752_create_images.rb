class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :book
      t.string :image_path

      t.timestamps
    end
  end
end
