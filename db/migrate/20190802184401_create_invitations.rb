class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :guest, index: true
      t.references :invited_event, index: true
      t.timestamps
    end
    add_foreign_key :guest, :users, column: :user_id
    add_foreign_key :invited_event, :events, column: :event_id
  end
end
