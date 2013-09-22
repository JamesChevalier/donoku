# Donoku

A simple Heroku-ready Sinatra-based app to collect donations via Stripe. This app forces an SSL connection outside of the Development environment.

## Configuration

* Set `ENV['STRIPE_PUBLISHABLE_KEY']` to your Stripe account's Publishable Key
* Set `ENV['STRIPE_SECRET_KEY']` to your Stripe account's Secret Key
* Edit lines 11 through 24 in `app.rb`
* Follow the steps [here](http://kb.mailchimp.com/article/how-can-i-add-my-signup-form-on-my-website#embedform) to get your MailChimp embed form. You should use the 'Naked' version of MailChimp's form.
* Paste that code into the `views/mailchimp.erb` file.

## Run Local

* Run `bundle install` to install the required gems
* Set `ENV['STRIPE_PUBLISHABLE_KEY']` to your Stripe account's Test Publishable Key or temporarily swap `ENV['STRIPE_PUBLISHABLE_KEY']` in `app.rb` with `"your_test_publishable_key"`
* Set `ENV['STRIPE_SECRET_KEY']` to your Stripe account's Test Secret Key or temporarily swap `ENV['STRIPE_SECRET_KEY']` in `app.rb` with `"your_test_secret_key"`
* Run `rackup` to run the server
* Go to [http://127.0.0.1:9292](http://127.0.0.1:9292) to use the site

## Deploy

* `heroku create`
* `heroku config:set STRIPE_PUBLISHABLE_KEY=something STRIPE_SECRET_KEY=something`
* `git push heroku master`
