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

def get_password_value(usr_matrix, message)
  usr_matrix[message[0]][message[1] - 1]
end

m1 = find_element_by_xpath(driver, '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[5]/th[1]')
m2 = find_element_by_xpath(driver, '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[6]/th[1]')
m3 = find_element_by_xpath(driver, '/html/body/center[3]/form/table/tbody/tr/td/table/tbody/tr[7]/th[1]')

m1_value = [m1.text[1], m1.text[3].to_i]
m2_value = [m2.text[1], m2.text[3].to_i]
m3_value = [m3.text[1], m3.text[3].to_i]

p1 = driver.find_element(:name, 'message3')
p2 = driver.find_element(:name, 'message4')
p3 = driver.find_element(:name, 'message5')

p1_value = get_password_value(@usr_matrix, m1_value)
p2_value = get_password_value(@usr_matrix, m2_value)
p3_value = get_password_value(@usr_matrix, m3_value)

p1.send_keys(p1_value)
p2.send_keys(p2_value)
p3.send_keys(p3_value)

driver.find_element(:name, 'OK').click
