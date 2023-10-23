#!/usr/bin/python3
'''
Python REST API
'''
import csv
import json
import requests
from sys import argv


def get_todo_and_export(employee_id):
    # Define URLs to fetch data from
    api_url = "https://jsonplaceholder.typicode.com"
    user_url = f"{api_url}/users/{employee_id}"
    todos_url = f"{api_url}/todos?userId={employee_id}"

    # Fetch user information
    user_response = requests.get(user_url)
    user_data = user_response.json()
    employee_name = user_data['name']

    # Fetch TODOs for the user
    todos_response = requests.get(todos_url)
    todos_data = todos_response.json()

    # Save tasks to a JSON file
    tasks_list = []
    for todo in todos_data:
        task_info = {
            "task": todo['title'],
            "completed": todo['completed'],
            "username": user_data['username']
        }
        tasks_list.append(task_info)
    with open(f"{employee_id}.json", "w") as json_file:
        json.dump({str(employee_id): tasks_list}, json_file, indent=4)


if __name__ == '__main__':
    # Accept integer as a parameter for employee ID
    # and display TODO list progress
    employee_id = int(argv[1])
    get_todo_and_export(employee_id)
