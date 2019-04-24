# frozen_string_literal: true

class RemovecateroyFromplays < ActiveRecord::Migration[5.2]
  def up
    # remove_column :plays, :caterory_id, :integer
  end

  def down
    # add_column :plays, :caterory_id, :integer
  end
end
