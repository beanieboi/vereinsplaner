# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text      :nickname, null: false
      t.text      :email, null: false
      t.text      :password_digest, null: false
      t.boolean   :admin, default: false, null: false
      t.integer   :sign_in_count, default: 0
      t.datetime  :current_sign_in_at
      t.datetime  :last_sign_in_at
      t.inet      :current_sign_in_ip
      t.inet      :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
