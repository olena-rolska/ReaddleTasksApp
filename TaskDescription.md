## Greetings %username% !

This is a quick manual on what we expect from you during performing the test task.

This will be a simple app that contains two features: Login & Checklist.

* First of all, get to know with the application under test, build the test app and check out its possibilities and bugs. 

* Second of all, we need to evaluate your qa manual background, so create down below:
 - short testplan 
 - list of the testcases
 - list of discovered issues
 
* Third of all, write test automation according test automation purposes  

* And fourth of all, push the whole project to github.com and notice us with a link to your repo on completion. 

Please reachout Oksana (otolstykh@readdle.com) if you have any questions.

## Good Luck!


#YOUR TASK STARTS HERE: 


# TEST PLAN: 

- Environment: Production as a main live environment

- What parts of app will be tested:
- installation
- login, 
- tasks in the list, 
- subtasks in the task, 
- returning from subtasks to the tasks screens,
- footer action buttons (both tasks and subtasks screen),
- logout (both tasks and subtasks screen)
- application delete


# LIST OF TEST CASES: 
// Only summaries of tests: e.g. 
- Perform login with empty password field

- Application installation
- Login with valid email and password
- Verify user cannot login with empty password field
- Verify user cannot login with empty email field
- Verify user cannot login with invalid email
- Verify user can login with 1-character password
- Logout from tasks screen
- Verify user is not logged out if tap “Cancel” button from Tasks screen
- Complete any task
- User tasks completion progress is saved after re-login verification
- Uncheck any task 
- Complete all tasks by tapping “Complete all” button in Tasks screen
- Uncheck all tasks by tapping “Cancel all” button in Tasks screen
- Sort all tasks in alphabetic order from A to Z by tapping “Sort by Name” button in Tasks screen
- Sort all tasks in alphabetic order from A to Z by tapping “Sort by Name” button in Subtasks screen
- Verify completing all subtasks automatically completes a task
- Open subtasks screen
- Verify uncheck all subtasks automatically uncheck a tasks
- Verify completing a task automatically completes all subtasks
- Verify user is not logged out if tap “Cancel” button from Subtasks screen
- Uncheck all tasks by tapping “Cancel all” button in Subtasks screen
- Complete all tasks by tapping “Complete all” button in Subtasks screen
- Logout from subtasks screen
- Complete all tasks by tapping on each checkbox
- Uncheck all tasks by tapping on each checkbox
- Verify uncheck a task automatically uncheck all subtasks
- Application delete


# LIST OF DISCOVERED ISSUES:
// Only summaries of bug reports: e.g.
- Login can be performed with empty password field (not a real issue)

1. Unexpected error while user logging in
2. Wrong task selection when user complete/uncomplete the task
3. Complete All/ Cancel all button tap do not complete/cancel completion of all tasks
4. Tasks are sorted randomly while user sort tasks by name
5. Sort by name action complete/uncomplete tasks/subtasks  
6. Complete all/Cancel all subtasks do not change their main task status
7. State of button "Cancel all" do not appear when all tasks are completed
9. User tasks completion progress is not saved after re-login

