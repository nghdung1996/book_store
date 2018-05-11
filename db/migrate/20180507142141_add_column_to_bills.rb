class AddColumnToBills < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :full_name, :string
    add_column :bills, :address, :string
    add_column :bills, :phone, :string
    add_column :bills, :email, :string
  end
end
