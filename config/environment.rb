# Load the rails application
require File.expand_path('../application', __FILE__)

FastTrip::Application.configure do

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: "smtp.elasticemail.com",
      port: 2525,
      domain: "fast-trip.herokuapp.com",
      authentication: "plain",
      user_name: "i.n.buryan@gmail.com",
      password: "gfvznbjktuf89",
      enable_starttls_auto: true
  }

end

# Initialize the rails application
FastTrip::Application.initialize!


