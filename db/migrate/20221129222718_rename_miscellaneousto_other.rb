class RenameMiscellaneoustoOther < ActiveRecord::Migration[5.2]
  def change
    rename_table :miscellaneous, :others
  end
end
