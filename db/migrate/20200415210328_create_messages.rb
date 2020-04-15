class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :recipients, array: true, null: false
      t.text :subject, null: false
      t.text :body, null: false
      t.integer :sender_id, null: false
      t.timestamps
    end
  end
end
