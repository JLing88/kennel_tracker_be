# Kennel Tracker Back End

[![ruby](https://img.shields.io/badge/ruby-v2.5.1-red.svg)](https://www.ruby-lang.org/en/)
[![rails](https://img.shields.io/badge/rails-v5.2.2-orange.svg)](https://rubyonrails.org/)
[![codecov](https://codecov.io/gh/mikecm1141/kennel_tracker_be/branch/master/graph/badge.svg)](https://codecov.io/gh/mikecm1141/kennel_tracker_be)

## Table of Contents

* [Live Links](#live-links)
* [Description](#description)
* [Development Team](#development-team)
* [System & Application Requirements](#system--application-requirements)
* [Installation & Database Initialization](#installation--database-initialization)
* [Test Suite](#test-suite)
    * [Running the Test Suite](#running-the-test-suite)
* [Dependencies](#dependencies)
    * [Testing & Development](#testing--development)
    * [Production](#production)
* [Back-end API Endpoints](#backend-api-endpoints)
    * [Current Reservations](#current-reservations)
        * [GET /api/v1/reservations/current](#get-apiv1reservationscurrent)
    * [Vet Endpoints](#vet-endpoints)
        * [GET /api/v1/vets](#get-apiv1vets)
    * [Owner Endpoints](#owner-endpoints)
        * [GET /api/v1/owners](#get-apiv1owners)
        * [POST /api/v1/owners](#post-apiv1owners)

## Live Links

- Front End Coming Soon!

## Description

This application tracks an animal type day care and boarding center. Its main
goal is to track the reservations the business has going for it. An admin can
add new pet owners (aka the paying customers), their pets, and their vet
information. Employees can then see which animals are checking in and out that 
day, what services they may need while there, what medications and feeding
instructions they have, and more.

This is a student led project with a real-world business application and use.

## Development Team

* [Mike McKee](https://github.com/mikecm1141/)
* [Jesse Ling](https://github.com/jling88)
* [Ahmad Kayyali](https://github.com/kayyali18)
* [Laura Shamus](https://github.com/lkshamus)

## System & Application Requirements

* [Ruby v2.5.1](https://www.ruby-lang.org/en/)
* [Ruby on Rails v5.2.2](https://rubyonrails.org/)
* [Bundler](https://bundler.io/)

## Installation & Database Initialization

1. Clone this repo to your local machine 
`git clone git@github.com:mikecm1141/kennel_tracker_be.git`
1. Change directories to the cloned project directory
1. Run `bundle install` to install the required dependencies
1. Run `rails db:{create,migrate}` to create the database and run migrations
1. (Optional) Run `rails db:seed` to seed the database with some fake default
data
1. Run `rails server` to start up the server
1. Application now available at `http://localhost:3000`

## Test Suite

This project is tested using [RSpec](http://rspec.info/), and aims to hit 100%
test coverage at all times.

### Running the Test Suite

1. Navigate to installed project directory
1. Run `rspec` to run the full test suite

## Dependencies

The following are the dependencies for this application.

### Testing & Development

* [RSpec-Rails](https://github.com/rspec/rspec-rails)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Factory Bot](https://github.com/thoughtbot/factory_bot)
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [Pry](https://github.com/pry/pry)
* [SimpleCov](https://github.com/colszowka/simplecov)
* [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [CodeCov](https://github.com/codecov/codecov-ruby)

### Production

* [Fast JSON Api](https://github.com/Netflix/fast_jsonapi)
* [Figaro](https://github.com/laserlemon/figaro)
* [Faker](https://github.com/stympy/faker)
* [Rack-CORS](https://github.com/cyu/rack-cors)

## Back-end API Endpoints

### Current Reservations

#### GET /api/v1/reservations/current

This endpoint returns all the current reservations and their associated owner
and pet information.

**Example Response**

```json
{
  "data": [
    {
      "id": "4",
      "type": "reservation",
      "attributes": {
        "runNumber": 23,
        "checkin": "2018-12-16T09:13:44.000-05:00",
        "checkout": "2018-12-21T06:41:40.000-05:00",
        "grooming": false,
        "daycare": true,
        "boarding": false,
        "owner": {
          "data": {
            "id": "7",
            "type": "owner",
            "attributes": {
              "firstName": "Randolph",
              "lastName": "Ankunding",
              "address": "Apt. 243 334 Kuphal Plains, Pamstad, AZ 03931",
              "homePhone": "442.576.6687",
              "cellPhone": "(835) 420-3987",
              "email": "colemanglover@wolff.info"
            }
          }
        },
        "pet": {
          "data": {
            "id": "15",
            "type": "pet",
            "attributes": {
              "name": "Roxie",
              "species": "Dog",
              "breed": "Patterdale Terrier",
              "color": "Black",
              "dob": "2015-06-02T20:00:00.000-04:00",
              "spayedNeutered": true,
              "medications": "None",
              "feedingInstructions": "3 times a day 1/2 cup",
              "shots": "Rabies: 12/10/2018"
            }
          }
        }
      }
    },
    {
      "id": "6",
      "type": "reservation",
      "attributes": {
        "runNumber": 27,
        "checkin": "2018-12-18T03:36:53.000-05:00",
        "checkout": "2018-12-21T22:10:52.000-05:00",
        "grooming": false,
        "daycare": true,
        "boarding": false,
        "owner": {
          "data": {
            "id": "10",
            "type": "owner",
            "attributes": {
              "firstName": "Gertrudis",
              "lastName": "Corkery",
              "address": "Suite 839 30263 Moen Lakes, West Selina, NC 91830-8845",
              "homePhone": "467.550.8660",
              "cellPhone": "(109) 776-7405",
              "email": "onalegros@bernhard.net"
            }
          }
        },
        "pet": {
          "data": {
            "id": "11",
            "type": "pet",
            "attributes": {
              "name": "Bruno",
              "species": "Dog",
              "breed": "Airedale",
              "color": "Black",
              "dob": "2017-03-18T20:00:00.000-04:00",
              "spayedNeutered": true,
              "medications": "None",
              "feedingInstructions": "3 times a day 1/2 cup",
              "shots": "Rabies: 12/10/2018"
            }
          }
        }
      }
    } ...
```

### Vet Endpoints

#### GET /api/v1/vets

This endpoint returns a list of all vets currently in the database.

**Example Response**

```json
{
    "data": [
        {
            "id": "1",
            "type": "vet",
            "attributes": {
                "practice_name": "Huels Group",
                "vet_name": "Dr. Rene Simonis III",
                "address": "3121 Herzog Plain, East Shaunnafurt, ME 22297",
                "phone": "616.445.0849",
                "email": "palmira@trompwatsica.info"
            }
        },
        {
            "id": "2",
            "type": "vet",
            "attributes": {
                "practice_name": "Schmeler-Harber",
                "vet_name": "Dr. Jazmine Kilback",
                "address": "36074 Lesa Glens, Wuckertville, LA 62025",
                "phone": "(155) 230-7742",
                "email": "clifford@kulas.name"
            }
        } ...
    ]
}
```

### Owner Endpoints

#### GET /api/v1/owners

This endpoint will return all owners currently in the database. Returns a 200
status code.

**Example Response**

```json
{
    "data": [
        {
            "id": "1",
            "type": "owner",
            "attributes": {
                "firstName": "Chadwick",
                "lastName": "Howell",
                "address": "50398 Kirlin Motorway, North Lauraview, SD 82594",
                "homePhone": "(213) 937-1325",
                "cellPhone": "842.960.0708",
                "email": "marilounienow@heaney.biz"
            }
        },
        {
            "id": "2",
            "type": "owner",
            "attributes": {
                "firstName": "Lora",
                "lastName": "Fahey",
                "address": "Suite 666 1719 Christoper Cape, West Bellfort, AZ 92662",
                "homePhone": "995.256.7246",
                "cellPhone": "1-643-290-1584",
                "email": "andreaswiza@langbarton.biz"
            }
        }, ...
    ]    
}
```

#### POST /api/v1/owners

This endpoint will create a new owner in the database. Returns a 201 upon
successful entry.  __First Name, Last Name, Address, and Home Phone are all
required fields.__

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "first_name": "George",
    "last_name": "Costanza",
    "address": "1700 16th St. New York City, NY 11111",
    "home_phone": "(555) 303 3003",
    "cell_phone": "(555) 300-3000",
    "email": "george@importerexporter.com" 
}
```

**Example Response**

```json
{
    "message": "Owner created"
}
```

Missing or invalid Owner creation parameters or missing header values will 
result in an error and a 400 status code response.

**Example Request**

```json
{
    "first_name": "",
    "last_name": "",
    "address": "1700 16th St. New York City, NY 11111",
    "home_phone": "(720) 303 3003",
    "cell_phone": "(720) 300-3000",
    "email":"george@importerexporter.com"
}
```

**Example Response**

```json
{
    "error": "First name can't be blank, Last name can't be blank"
}
```
