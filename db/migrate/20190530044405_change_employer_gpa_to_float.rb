class ChangeEmployerGpaToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column(:students, :gpa, :float)
  end
    def up
        change_column :students, :gpa, :float
    end

    def down
        change_column :students, :gpa, :float
    end
end
