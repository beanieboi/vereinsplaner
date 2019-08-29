class AddMemberId < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :member_id, :integer, null: false, default: 0
  end
end
