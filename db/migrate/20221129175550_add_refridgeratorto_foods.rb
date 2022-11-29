class AddRefridgeratortoFoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :foods, :refridgerator, foreign_key: true
  end
end
