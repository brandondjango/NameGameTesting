require 'require_all'
require_rel 'common_env.rb'

#Environment Variables



def start_name_game_chrome
  @browser = Watir::Browser.new(:chrome, switches: ['--ignore-certificate-errors'])
  page = NameGameHomePage.new @browser
  @browser.goto page.url_for_page
end

def start_name_game_firefox
  @browser = Watir::Browser.new(:firefox, switches: ['--ignore-certificate-errors'])
  page = NameGameHomePage.new @browser
  @browser.goto page.url_for_page
end

def start_mobile
  driver = Webdriver::UserAgent.driver(browser: :chrome, agent: :iphone, orientation: :portrait)
  @browser = Watir::Browser.new driver
  page = NameGameHomePage.new @browser
  @browser.goto page.url_for_page
end
