class PaymentStanding
  PAYMENT_DUE_DATE =

  def initialize(member)
    @member = member
  end

  def standing
    if last_payment.nil?
      never_payed_standing
    else
      regular_standing
    end
  end

  def never_payed_standing
    if @member.membership_started_at < 6.months.ago
      PaymentStanding.bad
    elsif @member.membership_started_at > 3.months.ago
      PaymentStanding.neutral
    elsif @member.membership_started_at > 1.months.ago
      PaymentStanding.good
    else
      PaymentStanding.unknown
    end
  end

  def regular_standing
    if last_payment.payed_at < 18.months.ago
      PaymentStanding.bad
    elsif last_payment.payed_at < 12.months.ago
      PaymentStanding.neutral
    elsif last_payment.payed_at > 12.months.ago
      PaymentStanding.good
    else
      PaymentStanding.unknown
    end
  end

  def last_payment
    @last_payment ||= @member.payments.last
  end

  def self.good
    "good"
  end

  def self.neutral
    "neutral"
  end

  def self.bad
    "bad"
  end

  def self.unknown
    "unknown"
  end
end