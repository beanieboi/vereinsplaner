module ApplicationHelper
  def last_payment_for_table(member)
    last_payment = member.last_payment
    if last_payment
      last_payment.payed_at
    else
      "keine Zahlung vorhanden"
    end
  end
end
