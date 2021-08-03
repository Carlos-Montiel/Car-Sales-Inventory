class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :model, default: ''
      t.string :brand, default: ''
      t.text :description
      t.decimal :price, precision: 15, scale: 2, default: 0
      t.integer :condition, default: 0 
      t.integer :stock, default: 0
      t.references :dealership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
