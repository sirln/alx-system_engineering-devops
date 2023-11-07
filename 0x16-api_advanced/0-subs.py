#!/usr/bin/python3
'''
Module to query the Reddit API
and return number of subscribers
for a given subreddit
'''
import requests


def number_of_subscribers(subreddit):
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'User-Agent': 'subreddit subscribers'}

    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        data = response.json()
        subscribers = data['data']['subscribers']
        return (subscribers)
    except Exception as e:
        return (0)
