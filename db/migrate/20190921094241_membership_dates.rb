class MembershipDates < ActiveRecord::Migration[6.0]
  def change
    rename_column :members, :member_since, :membership_started_at
    add_column :members, :membership_ended_at, :date
  end
end
