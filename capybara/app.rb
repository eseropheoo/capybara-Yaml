require 'capybara'
# Below is the code necessary to register the chrome driver
# http://www.rubydoc.info/github/jnicklas/capybara/Capybara.register_driver

Capybara.register_driver :firefox do |app|
  Capybara::RackTest::Driver.new(app, :browser => :firefox)
end
# The selenium driver should work out of the box trusting 
#the marionnette driver has been successfully installed
session = Capybara::Session.new(:selenium)

session.visit('http://toolsqa.com/automation-practice-form/')

session.fill_in 'firstname', with: 'charlie'
session.fill_in 'lastname', with: 'horse'

session.choose 'sex-0'
session.choose 'exp-6'

session.fill_in 'datepicker', with: '01/05/2018'

session.find(:css, '#profession-0').click
session.find(:css, '#tool-2').click
# select option for drop downs and selection groups bound by CSS ID and option name
session.select 'Europe', from: 'continents'
session.select 'Wait Commands', from: 'selenium_commands'

session.click_button 'submit'
session.find_button('Button')
# use puts to outputs the below text of the link
session.find_link('Partial Link Test').text

session.find(:xpath, '//*[@id="content"]/form/fieldset/div[8]/a').hover

sleep 5