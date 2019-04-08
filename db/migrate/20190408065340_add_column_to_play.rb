class AddColumnToPlay < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :url, :text
  end
end
