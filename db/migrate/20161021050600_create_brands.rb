class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.citext :name, index: true, unique: true, null: false
      t.integer :webmotors_code, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
