#!/usr/bin/python3
'''
Module to query the Reddit API
and returns a list containing the titles of all hot articles
for a given subreddit
'''
import requests


def recurse(subreddit, hot_list=[]):
    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    headers = {'User-Agent': 'titles of hot articles'}
    after = None
    params = {"after": after}
    try:
        response = requests.get(url, headers=headers, params=params,
                                allow_redirects=False)
        data = response.json()
        articles = data['data']['children']

        for article in articles:
            title = article['data']['title']
            hot_list.append(title)

        new_after = data['data']['after']

        if after is None:
            return (hot_list)
        else:
            return (recurse(subreddit))
    except Exception as e:
        return (None)
