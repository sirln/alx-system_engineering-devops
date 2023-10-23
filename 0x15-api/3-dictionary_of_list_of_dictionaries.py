#!/usr/bin/python3
'''
Python REST API
'''
import csv
import json
import requests
from sys import argv


def get_all_empolyee_tasks():
    # Define URLs to fetch data from
    api_url = "https://jsonplaceholder.typicode.com"
    user_url = f"{api_url}/users"
    todos_url = f"{api_url}/todos"

    # Fetch user information
    user_response = requests.get(user_url)
    user_data = user_response.json()

    # Fetch TODOs for the user
    todos_response = requests.get(todos_url)
    todos_data = todos_response.json()

    # Organize data
    organized_data = {}

    for user in user_data:
        user_id = user["id"]
        username = user["name"]
        organized_data[user_id] = []

        for todo in todos_data:
            task_info = {
                "username": username,
                "task": todo['title'],
                "completed": todo['completed']
            }
            organized_data[user_id].append(task_info)

    with open(f"todo_all_employees.json", "w") as file:
        json.dump(organized_data, file, indent=4)


if __name__ == '__main__':
    get_all_empolyee_tasks()
