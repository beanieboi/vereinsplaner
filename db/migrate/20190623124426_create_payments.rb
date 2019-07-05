class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :member_id
      t.bigint :amount
      t.date :payed_at
      t.integer :created_by_id
      t.timestamps
    end
  end
end
