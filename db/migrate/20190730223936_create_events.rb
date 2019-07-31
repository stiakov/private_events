class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.text :description
      t.date :date_event

      t.timestamps
    end
  end
end
