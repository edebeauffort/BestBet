class AddWinnerAttributeToSelection < ActiveRecord::Migration[5.0]
  def change
    add_column :selections, :winning_selection, :boolean, default: false
  end
end
