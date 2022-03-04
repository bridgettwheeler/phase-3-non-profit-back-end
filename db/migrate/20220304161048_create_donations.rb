class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :donation_amount
      t.integer :year
      t.datetime :donation_date
    end
  end
end
