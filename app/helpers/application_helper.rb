module ApplicationHelper
  def last_payment_for_table(member)
    return fa_icon("coins", style: 'color: #00ad00') if member.sepa_mandate?

    last_payment = member.last_payment
    if last_payment
      if last_payment.payed_at > 10.months.ago
        fa_icon("coins", style: 'color: #00ad00')
      else
        fa_icon("coins", style: 'color: #e52c00')
      end
    else
      fa_icon("coins", style: 'color: #e52c00')
    end
  end

  def bool_to_check_mark(value)
    if value
      fa_icon("check")
    else
      fa_icon("times")
    end
  end

  def mail_list(members)
    members.collect(&:contact_email).join(';')
  end
end
