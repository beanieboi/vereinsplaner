class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :tags, array: true, default: '{}'
      t.integer :created_by_id
      t.integer :updated_by_id
      t.timestamps
    end
  end
end
