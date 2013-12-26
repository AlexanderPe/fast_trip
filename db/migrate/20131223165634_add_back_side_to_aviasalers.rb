class AddBackSideToAviasalers < ActiveRecord::Migration
  def change
    add_column :aviasalers, :back_side, :boolean
  end
end
