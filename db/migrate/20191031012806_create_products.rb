class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.string :image
      t.decimal :price, null: false, default: 0.0, precision: 15, scale: 2
      t.decimal :cost

      t.timestamps
    end
  end
end
