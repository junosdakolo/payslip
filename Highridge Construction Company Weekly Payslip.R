library(random)

# Create a list of 400 workers with ID, gender, hours worked by each employee, and hourly rate paid to each employee
employees <- lapply(1:400, function(i) {
  list(
    id = i,
    gender = sample(c("Male", "Female"), 1),
    hours_worked = sample(24:70, 1),
    hourly_rate = sample(120:800, 1)
  )
})

# Generate payment slip for each worker using for loop
for (worker in employees) {
  tryCatch({
    # Calculate weekly salary
    weekly_salary <- worker$hours_worked * worker$hourly_rate
    
    # Assign employee level based on salary and gender
    if (10000 < weekly_salary & weekly_salary < 20000) {
      worker$level <- "A1"
    } else if (7500 < weekly_salary & weekly_salary < 30000 & worker$gender == "Female") {
      worker$level <- "A5-F"
    } else {
      worker$level <- "A0"
    }
    
    # Print payment slip details
    cat(sprintf("Employee ID: %d, Gender: %s, Weekly Salary: $%.2f, Level: %s\n",
                worker$id, worker$gender, weekly_salary, worker$level))
  }, error = function(e) {
    cat(sprintf("An error occurred for worker ID: %d. Error: %s\n", worker$id, e$message))
  })
}

