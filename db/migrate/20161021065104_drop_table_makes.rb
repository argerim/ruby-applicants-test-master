class DropTableMakes < ActiveRecord::Migration[5.0]
  def change
    drop_table :makes
  end
end
