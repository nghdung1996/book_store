class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :image_path, :image
  end
end
