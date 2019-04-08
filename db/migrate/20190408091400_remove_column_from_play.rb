class RemoveColumnFromPlay < ActiveRecord::Migration[5.2]
  def change
    remove_column :plays, :category_id, :integer
  end
end
