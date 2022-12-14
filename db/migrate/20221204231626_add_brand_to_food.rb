class AddBrandToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :brand, :string
  end
end
