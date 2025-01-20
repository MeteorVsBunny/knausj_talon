from selenium.webdriver.common.keys import Keys
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import json
from urllib.request import urlopen

from talon import Module, actions

CHROME_DRIVER_PATH = "C:\\chromedriver_win32\\chromedriver.exe"

global driver
def get_driver():
    return driver

def initialise_driver():
    try:
        actions.user.switcher_focus("chromedriver.exe")
        actions.sleep("500ms")
        actions.key("alt-f4")
    except RuntimeError:
        print("chrome not running")
    
    actions.key("super-2")
    actions.sleep("300ms")
    actions.key("super-shift-up")
    create_driver()

# Hangs if chrome is not running
def create_driver():
    global driver
    chrome_options = Options()
    chrome_options.experimental_options["debuggerAddress"] = "127.0.0.1:9222"
    driver = webdriver.Chrome(CHROME_DRIVER_PATH, chrome_options=chrome_options)
    driver.implicitly_wait(10) # seconds
    actions.key("alt-escape")
    # actions.key("super-down")

def quit_driver():
    global driver
    if driver:
        driver.quit()
    driver = None
  
def test_driver():
    switch_to_active_tab()
    driver.get('http://www.google.com')

def switch_to_active_tab():
    # print "current tab: " + driver.title.encode('ascii', 'backslashreplace')
    # active_tab = "current tab: " + driver.title.encode('ascii', 'backslashreplace')
    tabs = json.load(urlopen("http://127.0.0.1:9222/json"))
    # Chrome seems to order the tabs by when they were last updated, so we find
    # the first one that is not an extension.
    for tab in tabs:
        if not tab["url"].startswith("chrome-extension://"):
            active_tab = tab["id"]
            # print("active_tab: " + active_tab)
            if tab["type"] == "iframe":
                active_tab = tab["parentId"]
            break
    for window in driver.window_handles:
        # ChromeDriver adds to the raw ID, so we just look for substring match.
        print("window: " + window)
        if active_tab in window:
            driver.switch_to.window(window)
            # print("Switched to: " + driver.title.encode('ascii', 'backslashreplace'))
            return

def click(by, events):
    switch_to_active_tab()
    element = driver.find_element(by, events)
    print(element.id)
    print(element.text)
    print(element.get_property("href"))
    element.click()
    # element.send_keys(Keys.RETURN)

def submit(by, events):
    print("submit")
    switch_to_active_tab()
    element = driver.find_element(by, events)
    print(element.id)
    print(element.text)
    print(element.get_property("href"))
    # element.click()
    element.send_keys(Keys.RETURN)

def new_tab():
    actions.sleep("250ms")
    # tab to move focus from address bar sometimes
    actions.key("ctrl-t tab")
    # actions.key("ctrl-t")
    actions.sleep("250ms")
    switch_to_active_tab()

mod = Module()

@mod.action_class
class MySeleniumActions:
    def create_driver():
        ""
        create_driver()
    def test_driver():
        ""
        test_driver()
    def quit_driver():
        ""
        quit_driver()