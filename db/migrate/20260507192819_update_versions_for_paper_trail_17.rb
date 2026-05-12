# frozen_string_literal: true

class UpdateVersionsForPaperTrail17 < ActiveRecord::Migration[8.1]
  def up
    change_column_null :versions, :item_type, false if column_nullable?(:item_type)
    change_whodunnit_to_bigint
    remove_column :versions, :"{:null=>false}", :string if column_exists?(:versions, :"{:null=>false}")
  end

  def down
    change_whodunnit_to_string
    change_column_null :versions, :item_type, true unless column_nullable?(:item_type)
  end

  private

  def change_whodunnit_to_bigint
    if postgresql?
      invalid_count = select_value(<<~SQL.squish)
        SELECT COUNT(*)
        FROM versions
        WHERE whodunnit IS NOT NULL
          AND whodunnit <> ''
          AND whodunnit !~ '^[0-9]+$'
      SQL

      raise "versions.whodunnit contains non-numeric values" if invalid_count.to_i.positive?

      execute <<~SQL.squish
        ALTER TABLE versions
        ALTER COLUMN whodunnit TYPE bigint
        USING NULLIF(whodunnit, '')::bigint
      SQL
    else
      change_column :versions, :whodunnit, :bigint
    end
  end

  def change_whodunnit_to_string
    if postgresql?
      execute <<~SQL.squish
        ALTER TABLE versions
        ALTER COLUMN whodunnit TYPE character varying
        USING whodunnit::character varying
      SQL
    else
      change_column :versions, :whodunnit, :string
    end
  end

  def column_nullable?(column_name)
    column = columns(:versions).find { |candidate| candidate.name == column_name.to_s }

    column&.null
  end

  def postgresql?
    connection.adapter_name.casecmp("PostgreSQL").zero?
  end
end
