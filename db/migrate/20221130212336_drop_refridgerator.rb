class DropRefridgerator < ActiveRecord::Migration[5.2]
  def change
    drop_table :refridgerators
    drop_table :cabinets
    drop_table :freezers
    drop_table :others
  end
end
