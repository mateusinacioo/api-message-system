class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@appmessage.com"
  layout "mailer"
end
