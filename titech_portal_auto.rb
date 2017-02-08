require 'selenium-webdriver'
require './env.rb'

@driver = Selenium::WebDriver.for :firefox

@driver.get 'https://portal.nap.gsic.titech.ac.jp/GetAccess/Login?Template=userpass_key&AUTHMETHOD=UserPassword'
usr_name = @driver.find_element(:name, 'usr_name')
usr_name.send_keys(@usr_name)
usr_pass = @driver.find_element(:name, 'usr_password')
usr_pass.send_keys(@usr_password)
@driver.find_element(:name, 'OK').click

sleep 3

def get_password_value_from_message(message)
  @usr_matrix[message[0]][message[1] - 1]
end

def get_message_value_from_xpath(element)
  [element.text[1], element.text[3].to_i]
end

xpath_list = [
  '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[5]/th[1]',
  '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[6]/th[1]',
  '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[7]/th[1]'
]

pass_list = [
  @driver.find_element(:name, 'message3'),
  @driver.find_element(:name, 'message4'),
  @driver.find_element(:name, 'message5')
]

message_value = xpath_list.map { |e|
  get_message_value_from_xpath(@driver.find_element(:xpath, e))
}

pass_list.zip(message_value).map { |pass, message|
  pass.send_keys(get_password_value_from_message(message))
}

@driver.find_element(:name, 'OK').click
