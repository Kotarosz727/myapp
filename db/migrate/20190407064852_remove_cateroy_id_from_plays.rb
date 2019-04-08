class RemoveCateroyIdFromPlays < ActiveRecord::Migration[5.2]
  def change
    remove_column :plays, :caterory_id, :integer
  end
end
