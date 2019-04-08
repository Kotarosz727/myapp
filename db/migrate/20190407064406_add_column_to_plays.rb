class AddColumnToPlays < ActiveRecord::Migration[5.2]
 
  def up
    add_column :plays, :category_id, :inte
  end

  def down
    remove_column :plays, :caterory_id, :integer
  end
end
