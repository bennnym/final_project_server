class AddEmployerCompanyToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :company, :string
  end
end
