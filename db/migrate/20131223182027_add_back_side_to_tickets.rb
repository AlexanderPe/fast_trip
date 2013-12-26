class AddBackSideToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :back_side, :boolean
  end
end
