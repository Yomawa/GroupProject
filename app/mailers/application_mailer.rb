class ApplicationMailer < ActionMailer::Base
  default from: "reset@bootback.com"
  default_url_options[:host] = "localhost:3000"
end
