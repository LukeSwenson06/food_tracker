class AddRefridgeratorstoFood < ActiveRecord::Migration[5.2]
  def change
    add_reference :refridgerators, :food, foreign_key: true
  end
end
