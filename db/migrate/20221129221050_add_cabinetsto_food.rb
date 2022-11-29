class AddCabinetstoFood < ActiveRecord::Migration[5.2]
  def change
    add_reference :cabinets, :food, foreign_key: true
  end
end
