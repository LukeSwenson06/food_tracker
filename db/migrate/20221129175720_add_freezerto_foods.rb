class AddFreezertoFoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :foods, :freezer, foreign_key: true
  end
end
