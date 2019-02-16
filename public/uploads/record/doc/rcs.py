from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
import time

url = "http://localhost:3000/"
browser = webdriver.PhantomJS()
browser.get(url)

while True:
    browser.find_element_by_xpath("/html[1]/body[1]/form[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/a[2]").click()
    browser.find_element_by_xpath("/html[1]/body[1]/form[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/a[4]").click()
