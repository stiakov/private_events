class AddAcceptanceToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :acceptance, :boolean, null: true
  end
end
