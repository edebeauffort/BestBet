class RemoveClosingDateFromPools < ActiveRecord::Migration[5.0]
  def change
    remove_column :pools, :closing_date, :date
  end
end
