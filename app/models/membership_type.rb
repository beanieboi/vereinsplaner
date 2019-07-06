class MembershipType < ApplicationRecord
  has_many :members

  def self.full
    where(short: :full)
  end

  def self.discounted
    where(short: :discounted)
  end

  def self.passive
    where(short: :passive)
  end

  def self.support
    where(short: :support)
  end

  def self.unknown
    where(short: :unknown)
  end
end
