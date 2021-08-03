# Car Sales Inventory App

Small Ruby on Rails application that can do basic inventory management for a car dealership manager

It consists of 3 tables users, dealerships and cars, with the following functionality and characteristics:

- Users
  - can log in and can have type “user” or “admin”.
  - can only view the inventory of cars and their details when user_type is 'user'.
  - when user_type is 'admin' can add and delete cars from the inventorya and manage dealerships.
- Cars
  - have a monetary price. The price depreciates 2% every month automatically.
  - can be new or used.
  - belongs to a dealership.
- Dealerships
  - cars are located at a dealership, there may be multiple dealerships (has_many cars).
  - has crud operations managed by admin user.

Details and dependences:

* Ruby version 3.0.0
* Rails version 6.1.4
* PostgreSQL as database management system
* Rspec as testing framework using [rspec-rails gem](https://github.com/rspec/rspec-rails)
* [devise gem](https://github.com/heartcombo/devise) to manage authentication.
* [rails-i18n](https://github.com/svenfuchs/rails-i18n) and [devise-i18n gem](https://github.com/tigrish/devise-i18n) to manage internationalization
* to handle roles for the users is used [cancancan gem](https://github.com/CanCanCommunity/cancancan)
* [whenever gem](https://github.com/javan/whenever) to set cron jobs

## Installing
After cloning the repository just run in console:
```bash
bundle install
rails db:setup
```
With this, you have installed needed dependences, prepared the database and created an admin user, Now it's ready to use!

default credentials:
 - user: admin@email.com
 - password: 123456

## Set Cron Job to update Price of cars monthly
In order to update monthly the price of the cars (decreasing 2%) you need to set a cron job to run a task called services:update_car_prices if your server allows you can use whenever gem only running the following command:
```bash
whenever --update-crontab
```
If you are using heroku you may need to configure a scheduler to run the task.

## Using
You can create as many dealerships as you want and apply crud operations (admin user only), If you are an admin user you can manage CRUD operations to cars table, but if you user is type 'user' you only can access to read cars and its details.

## Testing
To run tests just type:
```bash
rspec -fd
```
It covers models test (relations, validations, callbacks), and some other request type test, and also test of the service included to update monthly cars prices. 

## Demo app
You can access to a demo of the app in the following [link](https://car-sales-inventory-app.herokuapp.com).