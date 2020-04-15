class ApplicationMailer < ActionMailer::Base
  default from: 'Vorstand TFC Leipzig e.V. <vorstand@tfc-leipzig.com>',
          reply_to: "vorstand@tfc-leipzig.com"
  layout 'mailer'
end

