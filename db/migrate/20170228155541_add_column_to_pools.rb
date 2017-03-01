class AddColumnToPools < ActiveRecord::Migration[5.0]
  def change
    add_column :pools, :end_date, :datetime
  end
end
