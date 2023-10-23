from bs4 import BeautifulSoup
import requests, re

r = requests.get('https://thehackernews.com/').content
soup = BeautifulSoup (r, "html.parser")
siteSearch = soup.find(class_="main clear")
hackerNews = soup.find_all("div", class_= "body-post clear")
print("Recent Hacker News Articles: \n ")
#Will pull recent news articles chronologically, but will ignore "Trending News" and "Popular Resources" articles.
for hackerNewsStory in hackerNews:
	storyTitle= hackerNewsStory.find("h2", class_="home-title")
	storyUrls = hackerNewsStory.find_all("a")
	for storyUrl in storyUrls:
		storyLink = storyUrl["href"]
	print("Story: ", storyTitle.text)
	print("URL: ", storyLink, "\n")
	
