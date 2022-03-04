class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
      create_table :memberships do |t|
        t.datetime :start_date
        t.datetime :end_date
        t.integer :year
        t.integer :user_id
    end
  end
end
