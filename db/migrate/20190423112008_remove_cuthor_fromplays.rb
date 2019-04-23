class RemoveCuthorFromplays < ActiveRecord::Migration[5.2]
  def up
    #remove_column :plays, :category_id, :integer
  end

  def down
    #add_column :plays, :category_id, :integer
  end

end
