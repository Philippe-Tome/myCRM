# myCRM 
Click here to access: https://my-crm-pt.herokuapp.com/

Technical Requirements  
What is myCRM and Why
How to use myCRM  
Development  
Problems  
Challenges  
Lessons
Features missing

---

### Technical requirements fot this project were the following:

* Have at least 2 resources(tables) (more if they make sense) – one representing someone using your application, and one that represents the main functional idea for your app
* Include sign up/log in functionality(if they make sense), with encrypted passwords & an authorization flow
* Have complete RESTful routes for at least one of your resources with GET, POST, PATCH, and DELETE
* Include wireframes that you designed during the planning process
* Have semantically clean HTML and CSS
* Be deployed online and accessible to the public
---
### What is myCRM and Why:
 
    I decided for this project to create a small CRM to track service reports from service engineers for their company's client. I work in a very disorganised company and wanted to explore how even a homemade simple solution could be beneficial for everyone. Currently at my workplace everything is stored on a server where each client has a folder and every employee has read/write permissions for these folders. Very dangerous as it is too easy for anyone to accidentally delete something and also very hard to search/filter any records for each company and to know who created/edited a document.  
---
### How to use myCRM:

    There are 3 different roles in total, "IT", "Manager" and "Engineer". Only an "IT" user can create a new user and assign them a role. 
    
    An "IT" user has read & write permissions to all records (clients, users, reports).  
    A "Manager" & "IT" users can create/edit/delete any company reports.
    An "Engineer" user can only create/edit/delete his/her report for each client listed.  
 
    When an "IT" user create a user he/she assigns it a temporary encrypted password. The new user can then login and change his/her password. 
---
### Development:

1. Technologies Used:
    * Html
    * CSS
    * Ruby
    * Sinatra


2. Planning:
    * Draw an ERD diagram.
    * Determine how many table I would need in my Database.
    * Write down all relations between tables.
    * Sketch the login page, IT page, Manager page, Engineer page and the setttings page.

3. Execution:  
    With only 2.5 days to do the whole lot I realised quickly that it would be impossible to implement all the features I had in mind. To make sure I would have an MVP to present on Friday I wrote a list of all the things that I wanted to implement and gave them a priority to know on which one was the most important and just focus on that until completed.
    




































### Features missing:

* I wanted to add a feature so that the users would have only 24 hours to change their password when first created but I ran out of time.
