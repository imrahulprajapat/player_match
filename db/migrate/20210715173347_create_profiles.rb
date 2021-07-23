# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :player
      t.integer :total_matches, default: 0, index: true
      t.decimal :highest_score, precision: 32, scale: 16, default: 0.0, null: false, index: true
      t.decimal :lowest_score, precision: 32, scale: 16, default: 0.0, null: false, index: true
      t.decimal :avg_score, precision: 32, scale: 16, default: 0.0, null: false, index: true
      t.integer :highest_scorer_match, index: true
      t.timestamps
    end
  end
end
