# Hackweek - AI powered VRT testing with Applitools

Simple Ruby/Capybara project that uses Applitools to add visual regression testing to Capybara Rspec test cases.

The test suite includes a basic 'hello world' spec to showcase the simplest implementation of Applitools functional visual regression testing.

The tic-tac-toe game examples show the reduction of code and logic that is possible when changing from a standard Capybara functional spec to one optimized for visual regression testing. There are substantial reductions in the amount of automation code that needs to created and maintained. This lowers engineering efforts and maintanence over time.

## Setup

1. Install dependencies - `bundle install`
2. Create `.env` file - `cp .env.template .env`
3. Create an account on [Applitools](https://applitools.com/)
3. Populate Applitools API key value in `.env` file
4. Run tests!

## Running Tests

### Run Hello World VRT tests

- `rake run-hello-world`

This will run a basic VRT test against the Applitools test hello world page located at: https://applitools.com/helloworld

### Run Traditional Tic-Tac-Toe tests

- `rake run-std-ttt`

This will run a typical set of standard Capybara test cases against the tic-tac-toe application

### Run VRT Tic-Tac-Toe tests

- `rake run-vrt-ttt`

This will run a set of test cases optimized for VRT against the tic-tac-toe application

## Resources

-  [Applitools](https://applitools.com/)