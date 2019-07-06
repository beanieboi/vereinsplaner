class MoveMembershipTypeToDatabase < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :membership_type_id, :integer, null: false, default: 0
    remove_column :members, :membership_type, :integer, null: false, default: 0
  end
end
