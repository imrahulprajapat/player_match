# frozen_string_literal: true

class CreateMatchDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :match_details do |t|
      t.references :player
      t.references :match
      t.decimal :score, precision: 32, scale: 16, default: 0.0, null: false
      t.timestamps
    end
  end
end
