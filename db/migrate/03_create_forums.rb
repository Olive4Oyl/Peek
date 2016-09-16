class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :city_name
      t.integer :location_id
    end
  end
end
