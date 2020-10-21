# Recipebook

## About

This is an application to display Marley Spoon recipes using the related information present within the Contentful platform.



## Demo application

This project has been prepared for ease of deployment and one can see a working version of the project on: https://marley-spoon-recipebook.herokuapp.com/. Demo screenshots of the working app are available [here](#screenshot-of-working-application)


## Code Related Design Decisions

* In order to be able to easily leverage the different Contentful content types, I've attempted to make use of the `contentful_rails` gem that in turn makes use of the `contentful_model` gem that is a wrapper around the Contentful Delivery SDK.

* Additionally, there are a few other reasons why I've chosen to use `contentful_rails` gem in order to make the app as production-ready as possible. Those reasons include:

  * Getting significant performance boosts by being able to leverage Russian Doll Caching out of the box. This can potentially come in very handy as the app evolves to support a larger user base. More details on how this can be leveraged are present [here](https://github.com/contentful/contentful_rails#allowing-russian-doll-style-caching-on-entries)
    * The gem comes with the added ability to handle `updated_at` timestamp related expiry through an easily integratable Webhooks endpoint

  * Images lose their emotional impact when not optimized properly for screen resolution and aspect ratios. With the gem, one can not only edit images on the fly to support multiple devices but also use features like `JPEG compression` to improve latency of one's pages and apps. More details on how this can be leveraged are present [here](https://www.contentful.com/blog/2014/08/14/do-more-with-images-on-contentful-platform/)

  * Out of the box support for rendering Markdown with the added ability to customise the Markdown Renderer to better suit one's needs


* Added Internationalisation capabilities so that the app is easily adaptable to support multiple languages as MarleySpoon continues to expand its presence worldwide.

* Have made use of System, view and model specs at appropriate places to have sufficient test coverage and also account for edge cases wherever applicable


### Areas of Improvement

* Pagination can be added to the list recipes page as we make more recipes available for our customers to choose from

* The app can be further improved to have a more intuitive look and feel with regard to various UI and UX aspects

* Error Tracking in production can be better managed through integration with tools like Sentry etc.,


## Usage

### Dependencies
* Ruby 2.7.0
* Please refer to the `Gemfile` for the other dependencies

### Setup
* Run `bundle` from a project's root directory to install the related dependencies.

### Running the program
In order to be able to be up and running with the app, one would have to follow the below steps:

From the project root directory:
* Create a `.env` file with the appropriate Contentful credentials using the `.env.sample` file present in the project root directory as a reference. Please note this step is applicable only when developing locally. The environment variables present in `.env.sample` need to be appropriately added when deploying to production environment using different providers like `Heroku`, `AWS` etc.,
* Start the rails app in the development environment with: `rails s`

One should now be able to see all the Marely Spoon recipes on the home page and also be able to navigate their way to a specific recipe by clicking on either the recipe title or image


### Running the tests
* One can run the specs from the project's root directory with the command `rspec`

### Screenshot of working application

#### Recipes List View page
---
![Recipes List View page](https://i.imgur.com/afkovoO.png "Marley Spoon Recipes")

#### Recipe Details View page
---
![Recipe Details View page](https://i.imgur.com/2XmRI3E.png "Marley Spoon Recipe Details")



