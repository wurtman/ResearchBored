class ApplicationMailer < ActionMailer::Base
  default from: ENV["APP_EMAIL_FROM"]
  layout "mailer"
end
