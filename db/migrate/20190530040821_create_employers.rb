class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.string :company
      t.text :password_digest

      t.timestamps
    end
  end
end
