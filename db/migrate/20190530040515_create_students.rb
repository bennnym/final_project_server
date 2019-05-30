class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.text :university
      t.decimal :gpa
      t.text :profile_photo
      t.text :cv
      t.integer :reserve_price
      t.datetime :auction_duration
      t.text :password_digest

      t.timestamps
    end
  end
end
