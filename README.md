# Lunch-and-Learn

## Welcome to Lunch and Learn

This project consumes 4 different api's and exposes information necessary for the front end of the team

## Learning Goals
- Consume APIs that require keys
- Expose data based on those api's that the "Front End" would hypothetically need
- Implement VCR to reduce API calls necessary

Tech requirements: 
- Ruby 2.7.4
- Rails 5.2.8

## Set Up

```bash
bundle install
```

Then to establish a database, run:

```bash
rails db:create
```

Because this is the back end repository, database migration is also necessary, run:

```bash
rails db:migrate
```

Next, create a application.yml file with

```bash
figaro install
```

### APIs and keys necessary
place these ENV variables in your application.yml 
(NOTE: this file should have been automatically placed in your.gitignore. double check if it is! don't expose your keys to anyone.)
- [Countries API](https://restcountries.com/#api-endpoints-v3-all) No key is needed
- [Edamam API](https://developer.edamam.com/edamam-recipe-api) Need to name edamam id as EDAMAM_APP_ID and api_key as EDAMAM_API_KEY
- [Youtube API](https://developers.google.com/youtube/v3/getting-started) name youtubes api_key as YOUTUBE_API_KEY
- [Upsplash API](https://unsplash.com/developers) name upsplash's key as UNSPLASH_ACCESS_KEY


### RSpec Suite

Once `lunch-and-learn` is correctly installed, run tests locally to ensure the repository works as intended.

To test the entire spec suite, run:

```bash
bundle exec rspec spec/
```

All tests should be passing if installation is successful.

### Calling APIs

- APIs can be called locally using a program like [Postman](https://www.postman.com). 

## Available Endpoints

### Create a New User
*Note:* pass `name` & `email` in request body

```bash
POST '/api/v1/users'
```

### Create a New Favorite for a User
*Note:* pass `api_key` (for whichever user is wanting the favorite), `country`, `recipe_link` & `recipe_title` in request body

```bash
POST '/api/v1/favorites'
```

### Get Recipes by Country
*Note:* the {} is not needed in this endpoint

```bash
POST '/api/v1/recipes?country={insert country here}'
```

### Get Recipes for a random country

```bash
POST '/api/v1/recipes'
```

### Get Learning Resources by country
*Note:* the {} is not needed in this endpoint

```bash
POST '/api/v1/learning_resources?country={insert country here}'
```

### Get a List of a User's Favorites
*Note:* the {} is not needed in this endpoint

```bash
POST '/api/v1/favorites?api_key={insert user's api_key here}'
```

## Check Me Out!

:bust_in_silhouette: **Anthony Blackwell Tallent** 
- anthonytallent567@gmail.com
- [GitHub](https://github.com/anthonytallent)
- [LinkedIn](https://www.linkedin.com/in/anthony-blackwell-tallent-b36916255/)

### If you got this far then thank you! have a great day!


