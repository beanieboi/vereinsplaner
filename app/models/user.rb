# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :nickname, :email, presence: true
  validates :admin, inclusion: { in: [true, false] }

  rails_admin do
    create do
      field :nickname
      field :email
      field :password
      field :password_confirmation
      field :admin
    end

    list do
      configure :password_digest do
        hide
      end
    end
  end
end
