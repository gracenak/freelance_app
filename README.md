<h1>Freelance App</h1>

Do you need to find a gig ASAP? Are you a contractor in need of
musicians? No problem! Here is a versitile application that can be utilized by musicians and contractors. Users have access to a listing of gigs, can submit applications upon interest of gigs, and meet fellow musicians/contractors through their profile. As a contractor, you can post gigs and will be provided with a listing of applications received at your home page. You will be able to review their profile to aid you in the hiring process.

This rails application was created as a project requirement for the <a href="https://flatironschool.com/career-courses/coding-bootcamp/online">Flatiron Online Software Engineering Program</a>.

For more information, check out <a href="https://gracenak.github.io/creating_a_sinatra_application">my blog</a> and a <a href="https://www.youtube.com/watch?v=fh4oVLbV48w">walkthrough demonstration</a> of this project.

An MVC rails application that uses:
<ul>
    <li> Sqlite database
    <li> ActiveRecord
    <li> RESTful routes and Nested routes
    <l1> Sessions
    <li> Signup/Login/Logout 
    <l1> Omniauth gems for login via Google
    <li> ORM - Object Relational Mapping between Models
        - belongs_to
        - has_many
        - has_many :through
        - many to many 
    <l1> CRUD functionality:
        - Create
        - Read
        - Update
        - Delete
    <li> One class level Active Record Scope methods
    <li> Helper methods to protect the views of the current_user. Only the logged_in user should be allowed to create, read, update, and delete their own gigs and user profile.
    <li> Helper methods and partials to limit logic in views and the controllers
    <li> Validations
        - uniqueness of a user's login attributes
        - input to protect from bad data being persisted into the database
    <li> Flash messages to display validation failures with error messages, and flash success messages to validate successful signup, logout, as well as successful creation and update of a gig. 
</ul>

<h2>Install Instructions</h2>
<ul>
    <li> Clone <a href="https://github.com/gracenak/freelance_app.git">this repo</a>.
    <li> Run 'bundle install'
    <li> Run 'rake db:migrate' # migrates the tables into the database
    <li> Run 'rake db:seed'    # migrates this seed file containing initial data to test the application with
    <li> Start running the server with 'rails s' and visit <a href="https://http://localhost:3000/"></a> to access the homepage.
    <li> Enjoy!
</ul>

<h2>Contributor's Guide </h2>
The Freelance Sinatra Expense Tracker is dedicated to bringing a welcoming, harrassment free, working environment. Please see the <a href="https://www.contributor-covenant.org/version/2/0/code_of_conduct/">Contributer Covenant Conduct of Code</a>.

<h2>License</h2>
This application is available as open source under the terms of the <a href="https://opensource.org/licenses/MIT">MIT License</a>.
