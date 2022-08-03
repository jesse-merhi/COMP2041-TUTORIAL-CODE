from bs4 import BeautifulSoup
import requests
url = 'https://www.health.nsw.gov.au/Infectious/covid-19/Pages/stats-nsw.aspx'
r = requests.get(url, allow_redirects=True)
soup = BeautifulSoup(r.content, 'html.parser')

print(soup.find_all("span",{"class": "number"}))