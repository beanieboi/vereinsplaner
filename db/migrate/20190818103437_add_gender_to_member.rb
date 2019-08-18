class AddGenderToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :gender, :text, null: false, default: "undisclosed"
  end
end
