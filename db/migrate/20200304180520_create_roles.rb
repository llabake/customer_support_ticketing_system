# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name, default: 'user'
      t.text :description

      t.timestamps
    end
  end
end
