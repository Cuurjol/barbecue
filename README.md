# Application BARBECUE

BARBECUE is designed for meeting friends and acquaintances in various places. It allows you to view events, subscribe to events of other users, create your own events, upload photos to events. User notifications by e-mail were realized in the application, when users add new photos, new comments to events in which they have been subscribed. Feature to enter the private event pages by a given PIN-code was also added in the application.


## Annotation

Application was created on `Ruby (v2.5.1)` and `Ruby on Rails (v5.2.2)`.

## Installation and running

Before running the application, you need to install all the necessary gems and prepare the database. In order to do this, you need to run the following comands in the terminal:
```
bundle install
bundle exec rake db:migrate
```

And it is also necessary to set up variable environments for working:

* Amazon S3 Storage

```
S3_ACCESS_KEY
S3_BUCKET_NAME
S3_BUCKET_REGION
```

* SendGrid

```
SENDGRID_USERNAME
SENDGRID_PASSWORD
```

Then, run the local server:
```
bundle exec rails s
```

After, go to the browser at `http://localhost:3000`.

You can watch a list of all used gems in the `Gemfile`.

## Heroku deployment

Study project is ready for deployment on the Heroku. The working version of the project can be viewed at [`Heroku website`](https://cuurjol-bbq.herokuapp.com/).

## Author

**Kirill Ilyin**, study project from [goodprogrammer.ru](https://goodprogrammer.ru/)
