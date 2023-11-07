#!/usr/bin/python3
'''
Module to query the Reddit API
prints the titles of the first 10 hot posts listed
for a given subreddit
'''
import requests


def top_ten(subreddit):
    url = f'https://www.reddit.com/r/{subreddit}/hot.json?limit=10'
    headers = {'User-Agent': 'subreddit 10 hot posts'}

    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        data = response.json()
        posts = data['data']['children']
        for post in posts:
            print(post['data']['title'])
    except Exception as e:
        print(None)
