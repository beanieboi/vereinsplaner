class AddSepa < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :sepa_mandate, :bool, null: false, default: false
  end
end
