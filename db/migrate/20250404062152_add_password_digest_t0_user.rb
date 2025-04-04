class AddPasswordDigestT0User < ActiveRecord::Migration[8.0]
  def change
    add_column :users , :password_degest , :string
  end
end
