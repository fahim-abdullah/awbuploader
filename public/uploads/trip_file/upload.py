# from selenium import webdriver
# from selenium.webdriver.common.keys import Keys
# from selenium.webdriver.chrome.options import Options
import os, time

# url = "https://airasiatesting.smartkargo.com/Login.aspx"
# browser = webdriver.Chrome()
# browser.get(url)
#
# # Login
# browser.find_element_by_xpath("//input[@title='Login ID']").send_keys("TEST800")
# browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_txtPwd']").send_keys("AirAsia#1")
# browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_btnLogin']").click()
#
# # Get URL
# browser.get("https://airasiatesting.smartkargo.com/GHA_frmExportManifest.aspx")
#


allFiles = os.listdir('doc')
flights = [i.split('.') if (i != '.DS_Store') else '' for i in allFiles]
print(flights)


for i in flights:
    if len(i) > 1:

        # browser.get("//input[@id='ctl00_ContentPlaceHolder1_txtFlightCode']").clear()
        # browser.get("//input[@id='ctl00_ContentPlaceHolder1_txtFlightCode']").send_keys(i[0].split('-')[0])
        # browser.get("//input[@id='ctl00_ContentPlaceHolder1_txtFlightID']").send_keys(i[0].split('-')[1])

        
