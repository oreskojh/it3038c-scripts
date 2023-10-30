import json
import requests

print('Please enter your zip code:')
zip = input()
r = requests.get('http://api.openweathermap.org/data/2.5/weather?zip=%s,us&appid=22bc394041581d06409778e5375d395f' % zip)
data=r.json()

print(data['weather'][0]['description'])
