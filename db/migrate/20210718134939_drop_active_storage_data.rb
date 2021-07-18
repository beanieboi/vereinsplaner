class DropActiveStorageData < ActiveRecord::Migration[6.1]
  def up
    drop_table :active_storage_data
  end

  def down
    # nothing to do
  end
end
