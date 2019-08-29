class DropMembershipFormBool < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :application_form_present
  end
end
