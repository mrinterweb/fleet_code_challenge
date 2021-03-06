Implementation Notes
====================

Demo app:

https://fleet-rate-demo.herokuapp.com/

To import the data run the following rake tasks:

    rake import:service_providers\[service_provider_data.csv\]
    rake import:rates\[rate_data.csv\]

Note: some of the rate data does not match with a service provider, and that rate data can not be imported. The rate entries in question have a "shipping company id" of 0. In total, 12 rate records failed.

Original Exercise
=================

Congratulations on moving forward in the interview process! We'd like you to build a bare-bones Rails application with a few key components to demonstrate proficiency in many common Ruby and Rails patterns, which you'll find yourself using day-to-day here.

We expect this exercise to take 2-3 hours at the most. Since this is a backend-focused challenge, we are not looking for styling or CSS work. And, don't concern yourself with configuring everything perfectly. This is just an exercise, so if you don't need to tweak something in order to meet the criteria below, leave it at defaults.

At Fleet, we work with money in most world currencies across our data model. For reporting purposes, we need to be able to work with all money amounts in a common currency of US dollars, in addition to the original currency it was stored with. For example, it should be easy to get a sum of all amounts in USD.

Although we'll leave it to you to otherwise decide which gems to bring in, we will recommend money-rails. And for this exercise, you'll need to add some currency conversion data. For the purposes of this exercise, assume USD -> EUR is 0.84663, and EUR -> USD is 1.18115. Don’t worry about any other currencies.

Please create a Rails app that stores and looks up rates from shipping service providers. The app should have these properties:

* A model to represent a shipping service provider. It should have these attributes:
  * Name of company
  * A flat shipping rate as a monetary value with currency

* A model to represent a shipping rate, different from the flat rate. It should have these attributes:
  * Rate as monetary value with currency (per kilo)
  * Origin, as two-letter country code
  * Destination, as two-letter country code

* Means of loading the attached data into a data store. We are not looking for a UI for this, console is fine.
* The converted monetary USD amounts all should be stored, in case we'd want to query them.
* A UI consisting of a list of all rates showing provider's name, origin, destination, nicely formatted rate as a monetary value, and nicely formatted common rate in USD. Above this list, a form that allows picking an origin & destination. Submitting this filters the list of rates by the selected origin and destination.  For instance, if I picked US and CN, I should only see rates with an origin of US and a destination of CN.
* Form that allows editing and updating a rate, accessible from the main list. Again, bare-bones, do not worry about making it pretty.  Allow changing all attributes except the common USD rate.
* Implement a reusable way to ensure that whenever a configurable money column is assigned, that same amount is also set as the other amount, but converted to USD. It should be easy to include this functionality into any other model that works with currency. Bring this functionality into both the shipping rate model and the shipping service provider model. This is an example of how it should behave:

  ```ruby
  some_model = SomeModel.new

  some_model.amount = 15.0
  some_model.currency = "EUR"
  some_model.save!

  some_model.amount # => 15.00 EUR
  some_model.common_amount # => 17.72 USD

  some_model.amount = 30.0
  some_model.currency = "EUR"
  some_model.save!

  some_model.amount # => 30.0 EUR
  some_model.common_amount # => 35.43 USD
  ```

When you are done, please email your repo to engineering@tryfleet.com. If you need to clarify anything regarding this challenge, feel free to email us there too.
