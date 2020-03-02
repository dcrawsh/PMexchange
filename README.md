# Portland Music Exchange

This application is designed to be used like Craiglist in allowing users to create and manage sales posts for musical instruments and equipment.  It is designed to be used by musicans in the Portland Metro Area.


## Architecture and models

There are 5 models in this project. Users have many posts, categories, and comments which are all created by a logged in user.  Posts can be viewable by anyone logged in or not.



## Development

This app is currently in development. Feel free to clone it down and give it a shot.  Images for posts are managed using Rails activestorage.


## Peculiarity X

Current styling is done using the Bootstrap CDN.  Additional attributes are in the process of being added to the post model.

## Getting started with this app

The setups steps expect following tools installed on the system.

Github
Ruby 2.6.1
Rails 6.0.2.1

1. Check out the repository
git clone git@github.com:dcrawsh/PMexchange.git

2. Create database.yml file
Copy the sample database.yml file and edit the database configuration as required.

cp config/database.yml.sample config/database.yml
3. Create and setup the database
Run the following commands to create and setup the database.

bundle exec rake db:create
bundle exec rake db:setup
4. Start the Rails server
You can start the rails server using the command given below.

bundle exec rails s
And now you can visit the site with the URL http://localhost:3000