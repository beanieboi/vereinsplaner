class Member < ApplicationRecord
  GENDER = ["male", "female", "undisclosed"]

  has_one_attached :application_form
  has_paper_trail skip: :application_form
  acts_as_taggable_array_on :tags

  belongs_to :membership_type
  has_many :payments

  validates :gender, inclusion: { in: GENDER }

  def self.full_members
    joins(:membership_type).where(membership_types: { short: :full}).where("membership_type_id = membership_types.id").where(membership_ended_at: nil)
  end

  def self.alumni
    where.not(membership_ended_at: nil)
  end

  def self.current
    where(membership_ended_at: nil)
  end

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

  def application_form_present?
    application_form.present?
  end

  def name
    [first_name, last_name].join(" ")
  end

  def age
    return if date_of_birth.nil?

    now = Time.now.utc.to_date
    now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
  end

  def male?
    self.gender == "male"
  end

  def female?
    self.gender == "female"
  end

  def self.next_member_id
    Member.maximum(:member_id) + 1
  end
end
