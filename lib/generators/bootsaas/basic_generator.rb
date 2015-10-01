require 'rails/generators'
module Bootsaas
  class BasicGenerator < Rails::Generators::Base
    # Add necessary gems to gemfile and run bundle install
    def install_gems
      gem 'brakeman', require: false
      gem 'bootstrap-sass'
      gem 'font-awesome-rails'
      gem 'annotate'

      # Add these gems to production environment only
      gem_group :production do
        gem 'rails_12factor'
      end

      Bundler.with_clean_env do
        run "bundle install"
      end
    end

    def configure_bootstrap_and_font_awesome
      create_file 'app/assets/stylesheets/application.css.scss', "@import 'bootstrap-sprockets';\n@import 'bootstrap';\n@import 'font-awesome';"
      FileUtils.rm %w( app/assets/stylesheets/application.css )
      append_to_file 'app/assets/javascripts/application.js', '//= require bootstrap-sprockets'
    end

    def create_static_pages
      if yes? "Do you want to create a static pages controller for the home page?"
        system "rails g controller StaticPages index"
        gsub_file 'config/routes.rb', "get 'static_pages/index'", ''
        route "root 'static_pages#index'"
      end
    end

    def create_dashboard
      if yes? "Do you want to create a dashboard controller?"
        system "rails g controller Dashboard index"
        gsub_file 'config/routes.rb', "get 'dashboard/index'", ''
        route "get '/dashboard', to: 'dashboard#index', as: 'dashboard'"
      end
    end

    def add_gravatar_helper
      insert_into_file "app/helpers/application_helper.rb", after: "module ApplicationHelper" do
        "\n\tdef gravatar_for user, options={size: 50}\n\t\t
          gravatar_id = Digest::MD5::hexdigest(user.email.downcase)\n\t\t
          size = options[:size]\n\t\t
          gravatar_url = 'https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}'\n\t\t
         image_tag(gravatar_url, alt: user.email, class: 'gravatar img-circle')\n\t
        end\n"
      end
    end

    #def add_padding_for_navbar
      #append_to_file 'app/assets/stylesheets/application.scss' do
        #"\n\nbody {\n
        #\tmargin: 0;\n
        #\tpadding: 0;\n
        #\tpadding-top: 50px;\n
        #}\n\n

        #.container-dashboard {\n
          #\tpadding-top: 20px;\n
        #}"
      #end
    #end
  end
end
