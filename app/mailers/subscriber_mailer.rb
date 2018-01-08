class SubscriberMailer < ApplicationMailer
  default from: "subscribe@highsandlows.us"

  def sample_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Sample Email')
  end
end
