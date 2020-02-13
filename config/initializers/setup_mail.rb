ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  Rails.application.credentials.dig(:sendgrid, :user_name),
  :password             =>  Rails.application.credentials.dig(:sendgrid, :password),
  :domain               =>  'https://supost-test.herokuapp.com',
  :enable_starttls_auto  =>  true
}