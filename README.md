# HelloFlexi

To run the application

* Clone it to your local machine and cd into the directory
* Run `bundle install`
* In `config/` update the filename of `database.yml.example` to `database.yml`
* Update the filename of `example.env` to `.yml` at the root of the application
* Run `bundle exec rake db:create`
* Run `bundle exec rake db:setup`
* Run `rails s`

For deploying to Heroku with Stripe
* `heroku create`
* `heroku config:set PUBLISHABLE_KEY=<pk_test_your_publishable_key> SECRET_KEY=<sk_test_your_publishable_key>`
* `git push heroku master`
* `heroku open`

For testing stripe payments
* Use these credit cards in test mode: [Credit Card Samples](https://stripe.com/docs/testing#cards)

### TODO items

* Implement find or create method for rake file
* Implement full integration for the Stripe coupon management system: https://stripe.com/docs/api/ruby#create_coupon
* Devise integration: https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
* Implement sign in for the user into the MB API
