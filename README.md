# BootSaaS

Bootstrap your start up! BootSaaS sets up your application and generates basic layouts to get your app started. Just create a blank rails app, add the gem and follow the installation instructions. Forget about the setup, concentrate on building the meat of your startup.

![Home Page](http://i.imgur.com/1PXcvms.png)
![Bottom of Homepage, Mailchimp form](http://i.imgur.com/xxmPiCZ.png)
![Pricing Table](http://i.imgur.com/RxpwEfm.png)
![Coming Soon Page](http://i.imgur.com/3ViE3bm.png)

### What it does

- Sets up Bootstrap
- Sets up a static pages controller, with layouts, views and partials for your front facing pages
- Sets up reusable partials for main navigation bar, footer, mailchimp form and pricing table throughout your site
- Creates a simple home page, a pricing page, and coming soon page
- Drive users through the pricing page before the coming soon page to measure commitment
- Sets up routes for your new pages
- Adds rails 12 factor gem for assets precompilation on heroku
- Adds brakeman gem for security
- Adds tests for your static pages!

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

BootSaaS will create a static pages controller for the front end of your app, a 'pricing' page to direct signups to and a 'coming soon' page so that you can measure the commitment of a user trying to sign up via the Pricing page. It's all bootstrap so you can hop in and get tweaking straight away! Drop in your google analytics, mailchimp form, and edit the css for customisation.

## With thanks

Thanks to http://startbootstrap.com for the sweet landing page template

## Contributing

1. Fork it ( https://github.com/spencerldixon/bootsaas/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request with nice documentation of your changes
