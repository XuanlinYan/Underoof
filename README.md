<br />

<!-- TABLE OF CONTENTS -->

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#paper-prototype">Paper Prototype</a>
    </li>
    <li>
      <a href="#functionality-summary">Functionality Summary</a>
      <ul>
        <li><a href="#sign-up">Sign Up</a></li>
        <li><a href="#sign-in">Sign In</a></li>
        <li><a href="#search-page">Search Page</a></li>
        <li><a href="#profile">Profile</a></li>
        <li><a href="#admin-access">Admin Access</a></li>
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

Underoof is the web application where users without a room can find the matched roommates based on room preferences. 

* Team members: Xiangyu Li, Xuanlin Yan, Xulin Wang, Zhengchu
* Github Repo Link: https://github.com/XuanlinYan/Underoof
* Heroku Link: https://underoof.herokuapp.com/
* Github Page Link: https://xuanlinyan.github.io/Underoof/
* Brandeis Project Text File: https://drive.google.com/file/d/1qwkGkl6xxQuL3eoA-hP2RmTGciKcAEfu/view?usp=sharing
* Presentation slides: https://drive.google.com/file/d/1bx4joXJEriN1XAxZEM-pmFjhwOPAsJDZ/view?usp=sharing

## Paper Prototype
https://drive.google.com/file/d/1oDYBoQf3NXEzCB66X1RcW6oX5WOZwlS9/view?usp=sharing

<!-- Functionality Summary -->
## Functionality Summary

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

#### Sign Up
* With name which is required
* With email, which is required and unique
* With password which must contain capitalized letters, uncapitalized letters and digits and has length between 8 and 15
* With password confirmation which has same rule as password has and must match the password
* With gender which is selected from a drop down menu including "Male", "Female", and "Prefer not to answer"
* Has error messages indicating where needs to be modified to sign up successfully

#### Sign In
* With unique email
* With password
* Shows error message "Incorrect username or password" if user does not exist or email and password does not match

#### Search
* Only signed in/up users could search
* Users could search pages with state, city, min price, max price, start date, end date and pet prefernce
* The content of city drop down menu is different based on which State is selected
* Search results could be sorted by min price, max price, start date and end date
* Default sort column is min price and default sort direction is asc
* Users could view details of each search result by clicking on "show" button
* On search details show page, users could see the selected user's personal information and room preferences and chat with them by clicking on "Let's chat" button
* Paginate to ensure number of search results on each page is no more than 30


#### Edit Profile
* On personal information page, it will display name, email, gender and avatar of the current user
* Users could edit their name, email, password, gender and upload the avatar
* Password and password confirmation form could be nil when submitting
* User who never uploaded the avatar, a default one will be displayed
* On room preferences page, it will display preferences(state, city, location, min price, max price, pet preference, start date and end date) of current user if they created one before. Otherwise, there will be a "Create preferences" page.
* Users could not modify any information of others

#### Chat
* Users could create, edit, destroy and show messages of a channel
* Users could see the sent and received messages without refreshing the page

#### Access Admin
* Use "/admin" to access the database. Underoof used the rails_admin gem to display all the data. This page supports administrators to manage all data include  edit, new, delete...
* When the current user's email is **admin@underoof.com**, the "Profile" button on the right top corner will transfer to "Admin", click it to see all users details or use "/underoofadmin"

#### Log Out
* By clicking ont "Log out" button on nav bar
* Redirect users to home page



## Url Patterns
* Home page: /
* Display the sign in page: **/signin**
* Display the sign up page: **/signup**
* Display of search page: **/search**
* Display search results without clicking on sortable column: **/search?direction=&sort=&state_id=&min_price=&max_price=&start_date=&end_date=&pet=Cat&commit=Search**
* Display of sorted search results by a certain order(descending order here) and according to a certain field(min price here) without search filter:       
**preferences?commit=Search&county_id=&direction=asc&end_date=&max_price=&min_price=&pet=&sort=min_price&start_date=&state_id=**
* Display of sorted search results by a certain order(descending order here) ，according to a certain field(min price here) and a certain filter(pet preference here): </br>  **/preferences?direction=desc&sort=min_price&state_id=&county_id=&city_id=&min_price=&max_price=&start_date=&end_date=&pet=Dog&commit=Search**
* Display next page of search results: **/preferences?commit=Search&county_id=&direction=desc&end_date=&max_price=&min_price=&page=2&pet=Dog&sort=min_price&start_date=&state_id=**
* Display of details of one search result: **/preferences/:id**
* Display of specific user's personal information profile page: **/users/:id/edit**
* Display of specific user's preference profile page: **/preferences/:id/edit**
* Log out: **/**
* Database Admin: **/admin**
* Users Admin: **/underoofadmin** (must login with email: admin@underoof.com)
* Chat index page: **/channels**
* Chat edit page: **/channels/:id/edit**
* Chat create page: **/channels/new**
* Specific chat messages page: **/channels/:id**


## Database Schema
### Models
* users(name: string, email:string, gender:string, password_digest:string)
* preferences(location: string, start_date: date, end_date:date, min_price: integer, max_price: integer, pet: string, user_id: foreign key referring id in users, state_id: foreign key referring id in states city_id: foreign key referring id in cities)
* states(name: string, two_digit_code:string )
* cities(name: string, state_id: foreign key referring id in states)
* messages(channel_id: foreign key referring id in channels, user_id: foreign key referring id in users, body: text)
* channels(name: string, dm: boolean)
* channel_users(channel_id: foreign key referring id in channels, user_id: foreign key referring id in users)
* active_storage_attachments, active_storage_blobs and active_storage_variant_records, added by active_storage, used for image uploading

### Assotiations
* User <-> Preference (one to one)
* User -> Image (one to one)
* State -> City (one to many)
* State -> Preference (one to many)
* City -> Preference (one to many)
* Channel -> Message (one to many)
* User -> Message (one to many)
* Channel <-> User (many to many, through ChannelUser)

## Planned Views
* Sign up page(implemented)
* Sign in page(implemented)
* Home page(implemented)
* Search page(implemented)
* Search results details page(implemented)
* Chat index page(implemented)
* Chat message page(implemented)
* Profile page(implemented)



## Dependencies
* [Bootstrap](https://getbootstrap.com)
* [Will_paginate](https://github.com/mislav/will_paginate)
* [will_paginate-bootstrap4](https://github.com/delef/will_paginate-bootstrap4)
* [kaminari](https://github.com/kaminari/kaminari)
* [Faker](https://github.com/faker-ruby/faker)
* [Bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)
* [Rails_admin](https://github.com/sferik/rails_admin)
* [Rails-controller-testing](https://github.com/rails/rails-controller-testing)
* [jQuery](https://www.botreetechnologies.com/blog/introducing-jquery-in-rails-6-using-webpacker)
* [city-state](https://github.com/loureirorg/city-state)
* [font_awesome5_rails](https://github.com/tomkra/font_awesome5_rails)
* [stimulus](https://stimulus.hotwire.dev/handbook/origin)
* redis
* mini_magick
* image_processing
