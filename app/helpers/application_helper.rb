module ApplicationHelper
  def last_payment_for_table(member)
    return "Lastschrifteinzug" if member.sepa_mandate?

    last_payment = member.last_payment
    if last_payment
      last_payment.payed_at
    else
      "keine Zahlung vorhanden"
    end
  end

  def bool_to_check_mark(value)
    if value
      fa_icon("check")
    else
      fa_icon("times")
    end
  end
end
