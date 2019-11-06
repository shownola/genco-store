class AddUsesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :uses, :text
  end
end
