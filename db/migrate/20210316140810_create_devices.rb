# frozen_string_literal: true

# Create devices table
class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :status
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
