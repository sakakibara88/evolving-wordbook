class AddIndexToItem < ActiveRecord::Migration[5.0]
  def change
    add_index :items, :item, unique: true
  end
end
