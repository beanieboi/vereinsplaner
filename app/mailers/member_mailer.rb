class MemberMailer < ApplicationMailer
  def general_email
    @message = params[:message]
    mail(to: "ben@tfc-leipzig.com", subject: @message.subject)
  end
end
