class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,  null: false
      t.integer     :price, null: false
      t.boolean     :postage, null: false
      t.text        :description, null: false
      t.references :seller, foreign_key: { to_table: :users }, null: false
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.timestamps
    end
  end
end
