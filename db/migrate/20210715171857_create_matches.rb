# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :title
      t.boolean :is_completed, default: false, index: true
      t.bigint :winner_id, index: true
      t.timestamps
    end
  end
end
