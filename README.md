# BootSaaS

Bootstrap your start up! BootSaaS sets up your application and generates basic layouts to get your app started. Just create a blank rails app, add the gem and follow the installation instructions. Forget about the setup, concentrate on building the meat of your startup.

### What it does

- Sets up Bootstrap
- Sets up a static pages controller, layouts, template views and partials for your front facing pages
- Creates a simple home page and a coming soon page
- Adds rails 12 factor gem for assets precompilation on heroku
- Sets up routes for your new pages
- Adds tests!

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

BootSaaS will create a static pages controller for the front end of your app and a 'coming soon' page to direct signups to. It's all bootstrap so you can hop in and get tweaking straight away! Drop in your google analytics, mailchimp form, and edit the sass for customisation.

## With thanks

Thanks to http://startbootstrap.com for the sweet landing page template

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bootsaas/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request with nice documentation of your changes
