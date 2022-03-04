class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.string :address_1
      t.string :address_2
      t.text :city
      t.text :state
      t.integer :zip_code
      t.string :email
      t.integer :phone
      t.string :password
      t.string :username
      t.integer :doner_id
      t.timestamps
    end
  end
end
