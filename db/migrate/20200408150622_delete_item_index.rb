class DeleteItemIndex < ActiveRecord::Migration[5.0]
  def change
    remove_index :items, :item
  end
end
