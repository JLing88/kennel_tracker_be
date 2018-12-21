# Kennel Tracker Back End

[![codecov](https://codecov.io/gh/mikecm1141/kennel_tracker_be/branch/master/graph/badge.svg)](https://codecov.io/gh/mikecm1141/kennel_tracker_be)

## Table of Contents

* [Live Links](#live-links)
* [Description](#description)
* [Development Team](#development-team)
* [System & Application Requirements](#system--application-requirements)
* [Installation & Database Initialization](#installation--database-initialization)
* [Back-end API Endpoints](#backend-api-endpoints)
    * [Current Reservations](#current-reservations)
        * [GET /api/v1/reservations/current](#get-apiv1reservationscurrent)
    * [Vet Endpoints](#vet-endpoints)
        * [GET /api/v1/vets](#get-apiv1vets)
    * [Owner Endpoints](#owner-endpoints)
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

* Coming Soon

## Installation & Database Initialization

* Coming Soon

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
