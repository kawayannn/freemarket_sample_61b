class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      # t.integer       :zip_code,       null: false,  unique: true
      # t.integer       :prefecture_id,  null: false
      # t.string        :city,           null: false
      # t.string        :street_name,    null: false, unique: true
      # t.string        :building_name
      # t.integer       :user_id,           foreign_key: true
      t.timestamps
    end
  end
end
