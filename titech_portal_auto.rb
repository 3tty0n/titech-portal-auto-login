require 'selenium-webdriver'
require './env.rb'

driver = Selenium::WebDriver.for :firefox

driver.get 'https://portal.nap.gsic.titech.ac.jp/GetAccess/Login?Template=userpass_key&AUTHMETHOD=UserPassword'
usr_name = driver.find_element(:name, 'usr_name')
usr_name.send_keys(@usr_name)
usr_pass = driver.find_element(:name, 'usr_password')
usr_pass.send_keys(@usr_password)
driver.find_element(:name, 'OK').click

sleep 3

def find_element_by_xpath(driver, path)
  driver.find_element(:xpath, path)
end

def find_element_by_name(driver, name)
  driver.find_element(:name, name)
end

def get_password_value(message)
  @usr_matrix[message[0]][message[1] - 1]
end

def get_message_value(element)
  [element.text[1], element.text[3].to_i]
end

m1 = find_element_by_xpath(driver, '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[5]/th[1]')
m2 = find_element_by_xpath(driver, '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[6]/th[1]')
m3 = find_element_by_xpath(driver, '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[7]/th[1]')

message_value = [m1, m2, m3].map { |m| get_message_value(m) }

p1 = driver.find_element(:name, 'message3')
p2 = driver.find_element(:name, 'message4')
p3 = driver.find_element(:name, 'message5')

pass_value = [p1, p2, p3].zip(message_value).map { |item|
  p_value = get_password_value(item[1])
  item[0].send_keys(p_value)
}

driver.find_element(:name, 'OK').click
