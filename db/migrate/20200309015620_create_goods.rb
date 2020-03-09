class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.references :content, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
