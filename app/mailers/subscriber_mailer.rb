class SubscriberMailer < ApplicationMailer
  default from: "subscribe@highsandlows.us"

  def subscribe_email(subscriber)
    @subscriber = subscriber

    headers "X-SMTPAPI" => {
     "sub": {
       "%name%" => [@subscriber.email]
     },
     "filters": {
       "templates": {
         "settings": {
           "enable": 1,
           "template_id": '44565408-e8ec-4324-ab45-53df0c66ee21'
         }
       }
     }
    }.to_json

    mail(to: @subscriber.email, subject: 'Thanks for subscribing!')
  end
end