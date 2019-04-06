class AddCaterogoryIdToPlay < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :caterory_id, :integer
  end
end
