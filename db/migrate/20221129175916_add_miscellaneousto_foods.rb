class AddMiscellaneoustoFoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :foods, :miscellaneous, foreign_key: true
  end
end
