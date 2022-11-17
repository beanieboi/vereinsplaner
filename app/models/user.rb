# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :nickname, :email, presence: true
  validates :admin, inclusion: { in: [true, false] }
end
