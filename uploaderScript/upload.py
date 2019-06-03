from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
import os, time, pandas

# Login
url = "https://airasia.smartkargo.com/Login.aspx"
browser = webdriver.Chrome()
browser.get(url)

browser.find_element_by_xpath("//input[@title='Login ID']").send_keys("1024349")
browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_txtPwd']").send_keys("AirAsia#9")
browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_btnLogin']").click()

browser.get("https://airasia.smartkargo.com/ePouchNew.aspx")

browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_txtAWBNo']").send_keys("01261525")
browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_btnShow']").click()

browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_grdePouch_ctl07_fileupload_ePouch']").send_keys("/Users/fahimabdullah/Desktop/test.png")
