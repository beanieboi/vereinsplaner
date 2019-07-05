class Member < ApplicationRecord
  acts_as_taggable_array_on :tags

  has_many :payments

  def membership_fee_in_euro
    return if membership_fee.nil?

    membership_fee / 100
  end

  def membership_fee_in_euro=(amount)
    self.membership_fee = Integer(amount) * 100
  end

  def payment_standing
    PaymentStanding.new(self).standing
  end

  def last_payment
    @last_payment ||= payments.last
  end

  def name
    [first_name, last_name].join(" ")
  end
end
