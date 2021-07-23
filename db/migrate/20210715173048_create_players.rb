# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :full_name
      t.string :country_code, limit: 3
      t.integer :contact_number, unique: true, index: true
      t.timestamps
    end
  end
end
