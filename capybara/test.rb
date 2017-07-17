require 'capybara'
# Below is the code necessary to register the chrome driver
# http://www.rubydoc.info/github/jnicklas/capybara/Capybara.register_driver

Capybara.register_driver :firefox do |app|
  Capybara::RackTest::Driver.new(app, :browser => :firefox)
end
# The selenium driver should work out of the box trusting 
#the marionnette driver has been successfully installed
session = Capybara::Session.new(:selenium)

session.visit('https://spartaglobal.slack.com/messages/G5997D94K/search/from:@iobichukwu/')
session.fill_in 'email', with: 'eseropheoo@spartaglobal.co'
session.fill_in 'password', with: ''
session.find(:css, '#signin_btn').click
session.has_css?('.ql-editor>p')
session.visit('https://spartaglobal.slack.com/messages/@oholden/')
session.find(:css, '.ql-editor>p').set 'Hi ollie, this is an automated message'
session.find(:css, '.ql-editor>p').send_keys(:enter)
sleep 15