# README
 
##### Ruby Version 

* `ruby 2.6.3`

##### Rails Version 

* `Rails 6.0.0`

##### Configuration

1. Clone repo `git@github.com:deepakvig/clock-event.git`
2. Run `bundle install`.
3. Run `rake db:create` to create the database
3. Run `rake db:migrate` to setup complete the database

##### Running Tests

Run `rspec`.


CHALLENGE QUESTIONS
----
##### How did you approach this challenge?

I created a **Monolithic** application where user has to be Registered first with a Unique email and Unique Name. User can Punch In! or Punch Out! only with the current Name otherwise User can login to Create/Update/Delete any TimeLog. User can also add some description to each TimeLog by Logging into the application.

##### What schema design did you choose and why?

I used Relational Database Design as we need TimeLog entried corresponding to each User, which can be easily achieved by using associations. And to make the system faster I have added indexes.

##### If you were given another day to work on this, how would you spend it? What if you were given a month?

If I have another day, I would prefer to add more test cases and improve the UI

If I have a month then I will try to add new features like:

1) Search
2) Heat Map to visualize the user patterns
3) A few other chart based on total time spent

These things will help in optimizing and managing the time in various scenarios. 
