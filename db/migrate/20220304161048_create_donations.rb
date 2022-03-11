class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.belongs_to :user
      t.integer :donation_amount
      t.integer :year
      t.timestamps
    end
  end
end
