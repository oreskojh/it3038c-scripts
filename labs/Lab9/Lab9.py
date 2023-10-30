import json
import requests

r = requests.get ('http://localhost:3000/')
data = r.json()
for dataPull in data:
	widgetName = dataPull['name']
	widgetColor = dataPull['color']
	print(widgetName.capitalize(), "is", widgetColor)
#print(data)
