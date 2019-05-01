# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :play, foreign_key: true

      t.timestamps
      t.index %i[user_id play_id], unique: true
    end
  end
end
