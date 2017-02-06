require 'selenium-webdriver'
require './env.rb'

@driver = Selenium::WebDriver.for :firefox

@driver.get 'https://portal.nap.gsic.titech.ac.jp/GetAccess/Login?Template=userpass_key&AUTHMETHOD=UserPassword'
usr_name = @driver.find_element(:name, 'usr_name')
usr_name.send_keys(@usr_name)
usr_pass = @driver.find_element(:name, 'usr_password')
usr_pass.send_keys(@usr_password)
@driver.find_element(:name, 'OK').click

sleep 2

def find_element_by_xpath(path)
  @driver.find_element(:xpath, path)
end

def find_element_by_name(name)
  @driver.find_element(:name, name)
end

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
  find_element_by_name('message3'),
  find_element_by_name('message4'),
  find_element_by_name('message5')
]

message_value = xpath_list.map { |e|
  get_message_value_from_xpath(find_element_by_xpath(e))
}

pass_list.zip(message_value).map { |pass, message|
  p_value = get_password_value_from_message(message)
  pass.send_keys(p_value)
}

@driver.find_element(:name, 'OK').click
