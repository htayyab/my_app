class RenamePasswordDegestToPasswordDigest < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :password_degest, :password_digest
  end
end
