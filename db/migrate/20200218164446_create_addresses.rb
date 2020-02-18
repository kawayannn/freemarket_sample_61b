class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer       :zip_code,       null: false,  unique: true
      t.integer       :prefecture_id,  null: false
      t.strring       :city,           null: false
      t.strring       :street_name,    null: false, unique: true
      t.strring       :building_name
      t.references    :user,           foreign_key: true
      t.timestamps
    end
  end
end
