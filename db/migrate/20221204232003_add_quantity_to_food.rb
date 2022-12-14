class AddQuantityToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :quantity, :integer
  end
end
