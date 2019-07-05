class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.date :date_of_birth

      t.text :street
      t.text :street_number
      t.text :postal_code
      t.text :city
      t.text :country

      t.text :contact_email
      t.text :contact_phone

      t.integer :membership_fee, null: false
      t.text :membership_type, null: false
      t.date :member_since, null: false

      t.boolean :application_form_present, null: false

      t.text :comment

      t.string :tags, array: true, default: '{}'
      t.timestamps
    end

    add_index :members, :tags, using: 'gin'
  end
end
