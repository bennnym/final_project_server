class AddColToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :employer_id, :integer
  end
end
