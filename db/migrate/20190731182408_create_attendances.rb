class CreateAttendances < ActiveRecord::Migration[5.2]
    def change
    create_table :attendances, index: false do |t|
      t.references :attendee, index: true
      t.references :attended_event, index: true
      t.timestamps
    end
    
    add_foreign_key :attendants, :users, column: :attendee_id
    add_foreign_key :attendants, :events, column: :attended_event_id
  end
end
