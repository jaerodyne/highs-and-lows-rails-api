# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview
	def sample_mail_preview
		SubscriberMailer.sample_email(Subscriber.first)
	end
end
