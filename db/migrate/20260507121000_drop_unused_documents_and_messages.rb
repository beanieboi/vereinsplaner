# frozen_string_literal: true

class DropUnusedDocumentsAndMessages < ActiveRecord::Migration[6.0]
  def up
    drop_table :documents, if_exists: true
    drop_table :messages, if_exists: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
