# BootSaaS

Bootstrap your start up! BootSaaS sets up your application and generates basic layouts to get your app started. Just create a blank rails app, add the gem and follow the installation instructions. Forget about the setup, concentrate on building the meat of your startup.

### What it does

- Sets up Bootstrap
- Sets up a static pages controller, with layouts, views and partials for your front facing pages
- Sets up reusable partials for main navigation bar, footer, mailchimp form and pricing table throughout your site
- Creates a simple home page, a pricing page, and coming soon page
- Creates a devise layout and styles devise forms
- Drive users through the pricing page before the coming soon page to measure commitment
- Sets up routes for your new pages
- Adds rails 12 factor gem for assets precompilation on heroku
- Adds brakeman gem for security
- Adds tests for your static pages!
- Font Awesome for icons
- A basic bootstrap dashboard layout with login and account routes (Relies on Devise routes)

### Optional

- Sets up layouts for devise generated pages
- Sets up mailer template for devise emails

## Installation

Add this line to your application's Gemfile (You may want to fix the version):

```ruby
gem 'bootsaas'
```

And then run:

    $ bundle

Or install it yourself as:

    $ gem install bootsaas

Then run:

```ruby
rails g bootsaas:install
```
Remove the gem once complete

To get the templates for devise, create your User model to use with devise, add the gem, and install devise as normal. Run your migrations as normal and generate the devise views. Then run the following installer to replace devises views with those of BootSaaS:

```ruby
rails g bootsaas:devise
```

BootSaaS will create a static pages controller for the front end of your app, a 'pricing' page to direct signups to and a 'coming soon' page so that you can measure the commitment of a user trying to sign up via the Pricing page. It's all bootstrap so you can hop in and get tweaking straight away! Drop in your google analytics, mailchimp form, and edit the css for customisation.

BootSaaS takes the policy of not hiding it's files in the gem. Instead, it copies these files to your project so you can run the generators, remove the gem, and tweak away to kickstart your project.

## Methods

```gravatar_for @user, size: 50```

- Returns the gravatar image for that user, just pass a user object that has an email property and an optional size parameter

## With thanks

Thanks to http://startbootstrap.com for the sweet landing page template

## Contributing

1. Fork it ( https://github.com/spencerldixon/bootsaas/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request with nice documentation of your changes
