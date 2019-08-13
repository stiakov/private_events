class AddDatetimeToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events , :date_event, :datetime
  end
end
