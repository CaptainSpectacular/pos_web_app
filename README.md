# MTGInventory

A basic inventory that is meant to transition into a functioning POS system targeted at small card shops. Key features include importing/exporting an inventory, displaying live pricing information from TCGPlayer, and processing transactions using Stripe.

# Deployed Application

You can find a production version of the app @ https://mtginventory.herokuapp.com/

# Getting Started


These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

# Prerequisites
### Ruby 2.4 + 
### Rails 5+
### PostgreSQL
### Installing

#### Clone down this repository

`git clone https://github.com/pollockcl/pos_web_app`


Change into the project directory
`cd pos_web_app`
#### Install dependencies

`bundle install`


 contact me to get an api key to communicate with the back end :)


     OR


 Sign up for a Stripe key @ www.stripe.com/ and build the back end separate

    `figaro install`


 Open application.yml

    `vim config/application.yml`

```
API_ID: COPY YOUR API ID HERE
API_KEY: COPY YOUR API KEY HERE
PUBLISHABLE_KEY: COPY YOUR STRIPE PUBLISHABLE KEY HERE
SECRET_KEY: COPY YOUR STRIPE SECRET KEY HERE
```

 save


 Run `rails db:{create,migrate,seed}`


 Run `rails server`


 Visit localhost:3000 in your browser

### Running the tests

Run `rspec` from the cmd or terminal.

#### Tests include:


 feature specs


 model specs


 Tested With


 Capybara


 factory_bot_rails


 vcr


 shoulda-matchers


 database_cleaner


### Built With


**jQuery** - Fetch calls for asynchronous loading.


**Devise** - Authentication


**Stripe** - Credit card processing


**TCGPlayer** - The web api used to perform price lookups on cards


**pos_api** - An internal API written in Rails to communicate with TCGPlayer



The application sends GET requests to an internal api, which forwards it to TCGPlayer to grab pricing and detail information.


### Contributing


This application is a work in progress, and I encourage pull requests and feedback on how it can be improved.