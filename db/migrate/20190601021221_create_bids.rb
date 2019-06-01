class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :employer_id
      t.integer :student_id
      t.integer :amount

      t.timestamps
    end
  end
end
