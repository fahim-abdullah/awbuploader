from selenium import webdriver
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
import os, shutil, time

url = "https://airasia.smartkargo.com/loginframe.aspx"
firefox_options = FirefoxOptions()
firefox_options.add_argument("--headless")
browser = webdriver.Firefox(options=firefox_options, executable_path="/srv/www/geckodriver")

browser.get(url)
browser.find_element_by_name("txtUserName").send_keys('Teleporter')
browser.find_element_by_name("txtPwd").send_keys('Teleport#1')
browser.find_element_by_id("btnLogin").click()

browser.get("https://airasia.smartkargo.com/ePouchNew.aspx")

allFiles = os.listdir('doc')
awbNums = [i.split('.') if (i != '.DS_Store') else '' for i in allFiles]

print(awbNums)

prefix = browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_txtAWBPrefix']")
awbInput = browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_txtAWBNo']")
showBtn = browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_btnShow']")

try:
    for i in awbNums:
        if len(i) > 1 :
            # Start writing log
            file = open("logfile.txt","a")
            file.write("Iniated process : " + i[0] + "\n")
            imagePath = os.getcwd() + ('/doc/' + i[0] + '.' + i[1])

            prefix.clear()
            prefix.send_keys(i[0][:3])
            awbInput.click()
            awbInput.send_keys(i[0][4:])
            showBtn.click()
            fileBtn = browser.find_element_by_xpath("//input[@id='ctl00_ContentPlaceHolder1_grdePouch_ctl07_fileupload_ePouch']")

            fileBtn.send_keys(imagePath)
            browser.find_element_by_xpath("//tbody//tr[7]//td[6]//input[1]").click()

            # Remove file
            shutil.copy('doc/' + i[0] + '.' + i[1], 'uploaded/' + i[0] + '.' + i[1])
            os.remove('doc/' + i[0] + '.' + i[1])

            file.write(i[0] + " Uploaded \n\n")
            file.close()
        else:
            pass
except:
    browser.quit()


browser.quit()
print("DONE")
