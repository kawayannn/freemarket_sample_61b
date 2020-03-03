class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,  null: false
      t.integer     :price, null: false
      t.integer     :postage, null: false
      t.text        :description, null: false
      t.integer     :condition, null: false
      t.integer     :shipment_day, null: false
      t.integer     :status, null: false, default: 0
      t.integer     :prefecture_id, null: false
      t.references :seller, foreign_key: { to_table: :users }, null: false
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
