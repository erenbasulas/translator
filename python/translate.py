from selenium import webdriver
from bs4 import BeautifulSoup
from urllib.request import Request, urlopen
import urllib.request
import time
from IPython.display import display
import requests
from os import system, name
import webbrowser
import subprocess
from signal import signal, SIGINT
from sys import exit

def func():
	purple="\033[1;35m"
	pink="\033[38;5;198m"
	green="\033[1;32m"
	white="\033[97m"
	blue="\033[1;34m"
	settings = webdriver.ChromeOptions()
	sl = open('lng_opt/sl.txt')
	tl = open('lng_opt/tl.txt')
	word = input(white + '--' + blue + sl.read().replace('\n', '') + white + '--to--' + pink + tl.read().replace('\n', '') + white + '--> ' + white)
	kok = '-i'
	hlp = open('readme.txt')
	cut = word.split()
	if kok in cut:
		sl = open('lng_opt/sl.txt')
		tl = open('lng_opt/tl.txt')	
		driverPath = open('options/chr_drv_path.txt')
		x = word.replace('-i', '')
		url = 'https://translate.google.com/#view=home&op=translate&sl=' + sl.read() + '&' + 'tl=' + tl.read()
		driver = webdriver.Chrome(driverPath.read().replace('\n', ''), options=settings)
		driver.get(url)
		driver.find_element_by_id('source').send_keys(x)
		time.sleep(1)
		html = driver.page_source
		spdrsrc = BeautifulSoup(html, 'html.parser')
		thing = None
		thing = spdrsrc.find('span', {'class':'tlid-translation translation'})
	settings.add_argument('headless')
	if word == '/help':
		print('\n', hlp.read(), '\n\n')
	if word == '/clear':
		clear()
	if word == '/exit':
		#driver.quit()
		exit()
	if word == '/options' :
		subprocess.Popen(['bash', 'options/options.sh']).wait()
	sl = open('lng_opt/sl.txt')
	tl = open('lng_opt/tl.txt')
	driverPath = open('options/chr_drv_path.txt')
	url = 'https://translate.google.com/#view=home&op=translate&sl=' + sl.read() + '&' + 'tl=' + tl.read()
	driver = webdriver.Chrome(driverPath.read().replace('\n', ''), options=settings)
	if word != '/options' and word != '/clear' and word != '/help':
		driver.get(url)
		driver.find_element_by_id('source').send_keys(word)
		time.sleep(1)
		html = driver.page_source
		spdrsrc = BeautifulSoup(html, 'html.parser')
		thing = None
		thing = spdrsrc.find('span', {'class':'tlid-translation translation'})
		if thing != None :
			print(pink + '\n\n----------------------------------------\n' + white)
			print ('\n', thing.text, '\n')
			print(pink + '----------------------------------------\n\n' + white)
		else:
			print ('\nCan not be blank\n')

def ctrlcFunc(signal_received, frame):
	print('\n\n\nSee you later, alligator\n\n')
	exit()

if __name__ == '__main__':
	signal(SIGINT, ctrlcFunc)

def clear():
	system('clear')

while True:
	func()