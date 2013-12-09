class AddPasswordResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datatime
  end
end