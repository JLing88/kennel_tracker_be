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
    * [Reservation Endpoints](#reservation-endpoints)
        * [POST /api/v1/reservations](#post-apiv1reservations)
        * [PATCH /api/v1/reservations](#patch-apiv1reservations)
    * [Pet Endpoints](#pet-endpoints)
        * [GET /api/v1/pets](#get-apiv1pets)
        * [POST /api/v1/pets](#post-apiv1pets)
        * [PATCH /api/v1/pets](#patch-apiv1pets)
    * [Vet Endpoints](#vet-endpoints)
        * [GET /api/v1/vets](#get-apiv1vets)
        * [POST /api/v1/vets](#post-apiv1vets)
        * [PATCH /api/v1/vets](#patch-apiv1vets)
    * [Owner Endpoints](#owner-endpoints)
        * [GET /api/v1/owners](#get-apiv1owners)
        * [POST /api/v1/owners](#post-apiv1owners)
        * [PATCH /api/v1/owners](#patch-apiv1owners)

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

* [Mike McKee](https://github.com/mikecm1141/) Backend API Team
* [Jesse Ling](https://github.com/jling88) Backend API Team
* [Ahmad Kayyali](https://github.com/kayyali18) Frontend Team
* [Laura Shamus](https://github.com/lkshamus) Frontend Team

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

### Reservation Endpoints

#### POST /api/v1/reservations

This endpoint allows a creation of a new reservation. __Pet ID must be valid,
Owner ID must be valid, and checkin and checkout fields are required.__

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "pet_id": "1",
    "owner_id": "1",
    "run_number": "1",
    "checkin": "2019-01-07",
    "checkout": "2019-01-14",
    "grooming": "true",
    "daycare": "false",
    "boarding": "true"
}
```

**Example Response**

```json
{
    "message": "Reservation created"
}
```

If pet ID or owner ID is missing or invalid, a 400 code is returned with the
following error message.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "pet_id": "1000",
    "run_number": "1",
    "checkin": "2019-01-07",
    "checkout": "2019-01-14",
    "grooming": "true",
    "daycare": "false",
    "boarding": "true"
}
```

**Example Response**

```json
{
    "error": "Pet must exist, Owner must exist"
}
```

If checkin or checkout date is left blank, the following error message is returned
along with a 400 status code.

```json
{
    "error": "Checkin can't be blank, Checkout can't be blank"
}
```

#### PATCH /api/v1/reservations

This endpoint allows for the updating of a reservation. Reservation must be
a valid reservation ID.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "1",
    "grooming": "false",
    "daycare": "true",
    "boarding": "false"
}
```

**Example Response**

```json
{
    "message": "Reservation updated"
}
```

If reservation ID is missing or invalid, the following error is returned with
a 400 status.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "1000",
    "grooming": "false",
    "daycare": "true",
    "boarding": "false"
}
```

**Example Response**

```json
{
    "error": "Reservation with ID 1000 not found"
}
```

### Pet Endpoints

#### GET /api/v1/pets

This endpoint returns a list of all pets currently in the database.

**Example Response**

```json
{
    "data": [
        {
            "id": "1",
            "type": "pet",
            "attributes": {
                "name": "Buster",
                "species": "Dog",
                "breed": "Swiss Mountain",
                "color": "Gray",
                "dob": "2015-02-22",
                "spayedNeutered": true,
                "medications": "None",
                "feedingInstructions": "3 times a day 1/2 cup",
                "shots": "Rabies: 12/10/2018",
                "owner": [
                    {
                        "id": 9,
                        "first_name": "Loida",
                        "last_name": "Sawayn",
                        "address": "Suite 357 7453 Randell Groves, Prestonburgh, AK 48663-0996",
                        "home_phone": "699.681.8780",
                        "cell_phone": "1-915-030-9958",
                        "email": "thu@lehnerupton.net",
                        "created_at": "2018-12-21T19:49:28.393-05:00",
                        "updated_at": "2018-12-21T19:49:28.393-05:00"
                    }
                ]
            }
        },
        {
            "id": "2",
            "type": "pet",
            "attributes": {
                "name": "Jack",
                "species": "Dog",
                "breed": "Japanese Spaniel",
                "color": "Black",
                "dob": "2012-09-11",
                "spayedNeutered": true,
                "medications": "None",
                "feedingInstructions": "3 times a day 1/2 cup",
                "shots": "Rabies: 12/10/2018",
                "owner": [
                    {
                        "id": 4,
                        "first_name": "Patty",
                        "last_name": "Breitenberg",
                        "address": "221 Hester Road, Lake Lionelbury, MD 01892-4029",
                        "home_phone": "1-386-158-0477",
                        "cell_phone": "1-653-772-7552",
                        "email": "franchesca@pacochacormier.net",
                        "created_at": "2018-12-21T19:49:28.352-05:00",
                        "updated_at": "2018-12-21T19:49:28.352-05:00"
                    }
                ]
            }
        }, ...
```

#### POST /api/v1/pets

This endpoint will create a new pet in the database. Returns a 201 upon
successful entry. __Name, species, breed, color, DOB and the spayed/neutered
field are all required.__

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "name": "George",
    "species": "Dog",
    "breed": "Catahoula",
    "color": "Brindle",
    "dob": "2017-06-05",
    "spayed_neutered": "true",
    "medications": "",
    "feeding_instructions": "A lot of food!",
    "shots": "All up to date"
}
```

**Example Response

```json
{
    "message": "Pet created"
}
```

Missing or invalid parameters listed above will result in a status of 400
and the following response.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "name": "George",
    "dob": "2017-06-05",
    "spayed_neutered": "true" 
}
```

**Example Response**

```json
{
    "error": "Species can't be blank, Breed can't be blank, Color can't be blank"
}
```

#### PATCH /api/v1/pets

This endpoint will allow updating of a specific given pet ID. Pet ID is required
and must be a valid ID for successful patch.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "1",
    "medications": "Insulin 2x a day"
}
```

**Example Response**

```json
{
    "message": "Pet updated"
}
```

Missing or invalid pet ID will result in a 400 error and an error message.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "1000",
    "medications": "Insulin 2x a day"
}
```

**Example Response**

```json
{
    "error": "Pet with ID 1000 not found"
}
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

#### POST /api/v1/vets

This endpoint will create a new vet in the database. Returns a 201 upon
successful entry. __Practice name and vet name are required.__

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "practice_name": "Good Dog Hospital",
    "vet_name": "Dr. Steven Tyler",
    "address": "311 16th St., Home, CO 19292",
    "phone": "620.333.2222",
    "email": "steven@gdhospital.org"
}
```

**Example Response

```json
{
    "message": "Vet created"
}
```

Missing or invalid parameters listed above will result in a status of 400
and the following response.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "practice_name": "Good Dog Hospital",
    "address": "311 16th St., Home, CO 19292",
    "phone": "620.333.2222",
    "email": "steven@gdhospital.org"
}
```

**Example Response**

```json
{
    "error": "Vet name can't be blank"
}
```

#### PATCH /api/v1/vets

This endpoint will allow updating of a specific given vet ID. Vet ID is required
and must be a valid ID for successful patch.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "1",
    "address": "1000 New Address Road, Denver, CO 80204"
}
```

**Example Response**

```json
{
    "message": "Vet updated"
}
```

Missing or invalid vet ID will result in a 400 error and an error message.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "1000",
    "address": "1000 New Address Road, Denver, CO 80204"
}
```

**Example Response**

```json
{
    "error": "Vet with ID 1000 not found"
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

#### PATCH /api/v1/owners

This endpoint will update an owner with the given ID with the values provided.
Not all values are required for a successful update. __ID however is a required
attribute and must be a current, valid owner ID.__

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "1",
    "first_name": "Steven"
}
```

**Example Response**

```json
{
    "message": "Owner updated"
}
```

Missing and/or invalid owner ID or missing header values will result in an error
and a 400 status code response.

**Example Request**

```json
// *** Headers ***

{
    "Content-Type": "application/json",
    "Accept": "application/json"
}

// *** Body ***

{
    "id": "10000",
    "first_name": "Steven"
}
```

**Example Response**

```json
{
    "error": "Owner with ID 10000 not found"
}
```
