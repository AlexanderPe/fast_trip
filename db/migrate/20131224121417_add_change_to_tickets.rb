class AddChangeToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :change, :boolean
  end
end
