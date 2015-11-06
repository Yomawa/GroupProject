class ApplicationMailer < ActionMailer::Base
  default from: "reset@bootback.com"
  default_url_options[:host] = "http://lit-cove-9743.herokuapp.com/"
end
