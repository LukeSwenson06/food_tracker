class AddLocationToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :location, :string
  end
end
