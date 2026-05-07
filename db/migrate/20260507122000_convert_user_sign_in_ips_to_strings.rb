# frozen_string_literal: true

class ConvertUserSignInIpsToStrings < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :current_sign_in_ip, :string if column_exists?(:users, :current_sign_in_ip)
    change_column :users, :last_sign_in_ip, :string if column_exists?(:users, :last_sign_in_ip)
  end

  def down
    return unless connection.adapter_name.downcase.include?("postgres")

    change_column :users, :current_sign_in_ip, :inet if column_exists?(:users, :current_sign_in_ip)
    change_column :users, :last_sign_in_ip, :inet if column_exists?(:users, :last_sign_in_ip)
  end
end
