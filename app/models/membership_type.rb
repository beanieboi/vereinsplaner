class MembershipType < ApplicationRecord
  has_many :members

  DEPRECATED = %w[discounted passive unknown].freeze

  def self.active
    where.not(short: DEPRECATED)
  end

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
