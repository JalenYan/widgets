# Widgets - The App For Widgets

## Setup

1. Pull down the app from version control
2. Make sure you have Postgres running
3. `bin/setup`

## Running The App

1. `bin/dev`

## Tests and CI

1. `bin/ci` contains all the tests and checks for the app
2. `tmp/test.log` will use the production logging format
    *not* the development one.

## Production

* All runtime configuration should be supplied
  in the UNIX environment
* Rails logging uses lograge. `bin/setup help`
  can tell you how to see this locally