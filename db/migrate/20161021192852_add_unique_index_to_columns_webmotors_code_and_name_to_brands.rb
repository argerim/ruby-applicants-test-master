class AddUniqueIndexToColumnsWebmotorsCodeAndNameToBrands < ActiveRecord::Migration[5.0]
  def change
    remove_index :brands, :webmotors_code
    remove_index :brands, :name
    add_index :brands, :webmotors_code, unique: true
    add_index :brands, :name, unique: true
  end
end
