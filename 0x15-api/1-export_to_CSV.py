#!/usr/bin/python3
'''
Python REST API
'''
import csv
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
    employee_name = user_data['username']

    # Fetch TODOs for the user
    todos_response = requests.get(todos_url)
    todos_data = todos_response.json()

    # Calculate total number of tasks and number of completed tasks
    total_tasks = len(todos_data)
    done_tasks = sum(1 for todo in todos_data if todo['completed'])

    # Display the progress
    print(f"Employee {employee_name} is done with tasks\
({done_tasks}/{total_tasks}):")

    # Display titles of completed tasks
    # for todo in todos_data:
    #     if todo['completed']:
    #        print(f"\t {todo['title']}")

    # Write tasks to CSV
    with open(f"{employee_id}.csv", 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)

        # Write header row
        writer.writerow(["USER_ID",
                         "USERNAME",
                         "TASK_COMPLETED_STATUS",
                         "TASK_TITLE"])

        # Write task data
        for todo in todos_data:
            writer.writerow([employee_id,
                             employee_name,
                             todo['completed'],
                            todo['title']])

    print(f"Data exported to {employee_id}.csv")


if __name__ == '__main__':
    # Accept integer as a parameter for employee ID
    # and display TODO list progress
    employee_id = int(argv[1])
    get_todo_and_export(employee_id)
