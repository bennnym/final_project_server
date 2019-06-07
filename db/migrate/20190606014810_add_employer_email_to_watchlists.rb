class AddEmployerEmailToWatchlists < ActiveRecord::Migration[5.2]
  def change
    add_column :watchlists, :employer_email, :text
  end
end
