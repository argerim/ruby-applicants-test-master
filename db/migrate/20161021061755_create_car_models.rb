class CreateCarModels < ActiveRecord::Migration[5.0]
  def change
    create_table :car_models do |t|
      t.citext :name, index: true, unique: true, null: false
      t.references :brand, foreign_key: true, null: false

      t.timestamps
    end
  end
end
