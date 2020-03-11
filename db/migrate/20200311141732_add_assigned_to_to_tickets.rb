# frozen_string_literal: true

class AddAssignedToToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :assigned_to, :string
  end
end
