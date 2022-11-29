class AddCabinettoFoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :foods, :cabinet, foreign_key: true
  end
end
