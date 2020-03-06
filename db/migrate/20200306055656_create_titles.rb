class CreateTitles < ActiveRecord::Migration[5.0]
  def change
    create_table :titles do |t|
      t.string :titl, null: false
      t.timestamps
    end
    add_index :titles, :titl, unique: true
  end
end
