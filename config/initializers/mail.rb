if Rails.env == "production"
	ActionMailer::Base.smtp_settings = {
	  :address        => 'smtp.sendgrid.net',
	  :port           => '587',
	  :authentication => :plain,
	  :user_name      => ENV['SENDGRID_USERNAME'],
	  :password       => ENV['SENDGRID_PASSWORD'],
	  :domain         => 'heroku.com',
	  :enable_starttls_auto => true
	}
end

if Rails.env == "development"
	ActionMailer::Base.smtp_settings = {
	  :address        => 'smtp.sendgrid.net',
	  :port           => '587',
	  :authentication => :plain,
	  :user_name      => Rails.application.secrets.sendgrid_username,
	  :password       => Rails.application.secrets.sendgrid_password,
	  :domain         => 'heroku.com',
	  :enable_starttls_auto => true
	}
end
