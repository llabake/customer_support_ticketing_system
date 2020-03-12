[![Coverage Status](https://coveralls.io/repos/github/llabake/customer_support_ticketing_system/badge.svg?branch=develop)](https://coveralls.io/github/llabake/customer_support_ticketing_system?branch=develop)
[![Maintainability](https://api.codeclimate.com/v1/badges/9f786a0f75564a775d6d/maintainability)](https://codeclimate.com/github/llabake/customer_support_ticketing_system/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9f786a0f75564a775d6d/test_coverage)](https://codeclimate.com/github/llabake/customer_support_ticketing_system/test_coverage)

# Customer Support Ticketing System

## Requirements

#### Ruby

This application uses Ruby version `2.6.5`. To install use `rvm` or `rbenv`.

* RVM

        rvm install 2.6.5
        rvm use 2.6.6
    - To set Ruby `2.5.3` as the default Ruby version for your computer, run 
        
            rvm use 2.6.5 --default

* Rbenv

        rbenv install 2.6.5
    - To switch to `2.6.5` temporarily for this project, use 
            
            rbenv local 2.6.5
    
    - To use this version as the default Ruby version for your global environment, use 
            
            rbenv global 2.6.5

#### Bundler

Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed

To install:

        gem install bundler

#### Rails

This applications uses the one of the latest versions of rails. You will need to upgrade if you don't already have it installed. The rails version being used is `rails 6.0.2.1
`.

To install:

        gem install rails

#### MySQL

This application makes use of the postgres database. For local development, you need to install it.
To install postgres using `brew`:

        brew install mysql
        gem install mysql2


## Error Handling

| Error Message                                                           | Possible Solution                                                        |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| While install `mysql2 gem` an error occurs | Run `bundle config build.mysql2 --with-opt-dir=/usr/local/opt/openssl` then `bundle install` |
    
## Installation

To get up and running with the project locally, follow the following steps.

* Clone the app

        git clone https://github.com/llabake/customer_support_ticketing_system.git

* Move into the directory and install all the requirements.

    ```bash
    cd customer_support_ticketing_system/

    bundle install
    ```

* Setup the database

    Run this command `EDITOR=vim rails credentials:edit` to enter the correct `database credentials` <br> with your database username and password
    
    Then run:

        rails db:create
        rails db:migrate

    Please note that if you don't have `vim` installed in your machine, you could use your a different editor.

* To seed the application with data then run;

        rails db:seed

    Now visit [localhost:3000](http://localhost:3000)

* To run test
        
        rspec 

#### Endpoints

# Authentication

- It uses JSON Web Token (JWT) for authentication.
- Token is generated at sign up
- Token gets verified each time user interact with the application

Request type | Endpoint | Action
------------ | -------- | ------
POST | [localhost:3000/signup](#create-user) | Registers a new user
POST | [localhost:3000/auth/login](#login) | Logs a user in
POST | [localhost:3000/tickets](#add-ticket) | Add a new ticket
GET | [localhost:3000/tickets](#get-all-tickets) | Get all tickets for a user
PUT | [localhost:3000/tickets/:ticket_id](#update-a-ticket) | Update a ticket for a user
GET | [localhost:3000/tickets/:ticket_id](#get-a-ticket) | Get a ticket
DELETE | [localhost:3000/tickets/:ticket_id](#delete-a-ticket) | Delete a ticket
POST | [localhost:3000/tickets/:ticket_id/comments](#comment-on-a-ticket) | Add comment to a ticket

GET | [localhost:3000/admin/tickets](#get-all-tickets) | Get all tickets by an admin
PUT | [localhost:3000/admin/tickets/:ticket_id](#update-a-ticket) | Update a ticket by an admin

GET | [localhost:3000/agent/tickets](#get-all-tickets) | Get all tickets assigned to an agent
PUT | [localhost:3000/agent/tickets/:ticket_id](#update-a-ticket) | Update a ticket by an agent
GET | [localhost:3000/agent/tickets/export](#export-tickets) | Export tickets by an agent

# Assumptions
- When a user creates a ticket, it is unassigned until an admin comes to assign it to an agent
- A ticket is in progress only when an agent starts to work on it and not when it gets assigned
- A ticket can be pending if resolving it is blocked by other team members aside the agent working on it
- 

# Limitations
- The export can be slow for very large data as it is not presently being run in a background job
- The application does not present utilise serializers
