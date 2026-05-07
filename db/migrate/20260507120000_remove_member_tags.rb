# frozen_string_literal: true

class RemoveMemberTags < ActiveRecord::Migration[6.0]
  def change
    remove_index :members, name: :index_members_on_tags, if_exists: true
    remove_column :members, :tags, :string, array: true, default: [], if_exists: true

    drop_table :tags, if_exists: true do |t|
      t.text :object
      t.text :name
      t.timestamps
    end
  end
end
