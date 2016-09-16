class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :zip_location
      t.integer :location_id
    end
  end
end
