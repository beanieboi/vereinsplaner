class CreateMembershipTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :membership_types do |t|
      t.text :short
      t.text :name
      t.timestamps
    end
  end
end
