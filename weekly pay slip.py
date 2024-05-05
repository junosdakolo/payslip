
import random

# Create a list of 400 workers with ID, gender, hours worked by each employee, and hourly rate paid to each employee
employees = [
    {'id': i, 'gender': random.choice(['Male', 'Female']), 'hours_worked': random.randint(24, 70), 'hourly_rate': random.randint(120, 800)}
    for i in range(1, 401)
]

# Generate payment slip for each worker using for loop
for worker in employees:
    try:
        # Calculate weekly salary
        weekly_salary = worker['hours_worked'] * worker['hourly_rate']
        
        # Assign employee level based on salary and gender
        if 10000 < weekly_salary < 20000:
            worker['level'] = 'A1'
        elif 7500 < weekly_salary < 30000 and worker['gender'] == 'Female':
            worker['level'] = 'A5-F'
        else:
            worker['level'] = 'A0'
        
        # Print payment slip details
        print(f"Employee ID: {worker['id']}, Gender: {worker['gender']}, Weekly Salary: ${weekly_salary}, Level: {worker['level']}")
    
    except Exception as e:
        print(f"An error occurred for worker ID: {worker['id']}. Error: {e}")