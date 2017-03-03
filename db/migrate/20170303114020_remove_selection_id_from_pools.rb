class RemoveSelectionIdFromPools < ActiveRecord::Migration[5.0]
  def change
    remove_column :pools, :selection_id, :integer
  end
end
