<br />




<!-- TABLE OF CONTENTS -->

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#functionality-summary">Functionality Summary</a>
      <ul>
        <li><a href="#homepage-search">Homepage Search</a></li>
        <li><a href="#sign-up">Sign Up</a></li>
        <li><a href="#sign-in">Sign In</a></li>
        <li><a href="#admin-access">Admin Access</a></li>
        <li><a href="#profile">Profile</a></li>
        <li><a href="#search-filter">Search Filter</a></li>
        <li><a href="#sort-search-results">Sort Search Results</a></li>
        <li><a href="#log-out">Log Out</a></li>
      </ul>
    </li>
    <li><a href="#url-patterns">Url Patterns</a></li>
    <li><a href="#database-schema">Databse Schema</a></li>
    <li><a href="#planned-views">Planned Views</a></li>
    <li><a href="#dependencies">Dependencies</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

Underoof is the web application where one can find the matched roommates. 

* Team members: Xiangyu Li, Xuanlin Yan, Xulin Wang, Zhengchu
* Github Repo Link: https://github.com/XuanlinYan/Underoof
* Heroku Link: https://frozen-plains-73257.herokuapp.com/




<!-- Functionality Summary -->
## Functionality Summary

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

#### Homepage Search
On the home page, without out signing in, user chooses a location from the search drop down menu to view the blurred profile picture of matched rommates
(blurry picture not implemented yet)

#### Sign Up

On the home page, user clicks sign up button on navbar, fills in user name, email, password and password comfirmation and gender and submit, he/she is automatically signed in.

#### Sign In
On the home page, user clicks sign in button on nav bar, fills in email and password and clicks sign in to get to the individual home page
#### Admin Access
Use "localhost:3000/admin" to access database...(TO BE FILLED IN)
#### Profile
On individual home page, user click profile to edit user name or email, or fill in password and password confirmation to update password.
#### Search Filter
On individual home page, click search button on nav bar. On the popped up filter page, user selects location (country, state, city), preferred max and min price, preffered lease start date and end date and per preference and clicks search, the matched rommates information is displayed. 
#### Sort Search Results
User clicks colomn name (max price, min price, start date and end date) he/she intends to sort by, the search results will be sorted in order by the clicked field.

#### Log Out
User clicks log out button on nav bar to exit.



## Url Patterns
* Home page: /
* Display the sign in prompt and check for correct password: **/signin**
* Display the user sign up form and check for valid user name, email and password: **/signup**
* Display of specific user's profile page and prompt of whether successfully edit: **/users/1234/edit**
* Display of search filter and all users: **/search**
* Display of sorted search results by a certain order(descending order here) and according to a certain field(min price here):       
**/search?direction=desc&sort=min_price**
* Display of sorted search results by a certain order(descending order here) ， according to a certain field(min price here) and a certain filter(pet preference here): </br>  **/search?direction=desc&sort=min_price&state_id=&county_id=&city_id=&min_price=&max_price=&start_date=&end_date=&pet=Dog&commit=Search**
* Log out: **/logout**
* (Admin url To BE FILLED IN)




## Database Schema
(TO BE FILLED IN)


## Planned Views
(TO BE FILLED IN)



<!-- LICENSE -->
## Dependencies
* [Bootstrap](https://getbootstrap.com)
* [Will_paginate](https://github.com/mislav/will_paginate)
* [kaminari](https://github.com/kaminari/kaminari)
* [Faker](https://github.com/faker-ruby/faker)
* [Bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)
* [Rails_admin](https://github.com/sferik/rails_admin)
* [Rails-controller-testing](https://github.com/rails/rails-controller-testing)












