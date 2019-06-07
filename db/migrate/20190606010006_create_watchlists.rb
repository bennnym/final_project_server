class CreateWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlists do |t|
      t.integer :employer_id
      t.integer :student_id
      t.text :student_name

      t.timestamps
    end
  end
end
