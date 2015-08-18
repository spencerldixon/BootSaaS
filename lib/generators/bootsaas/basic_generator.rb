require 'rails/generators'
module Bootsaas
  class BasicGenerator < Rails::Generators::Base
    # Add necessary gems to gemfile and run bundle install
    def install_gems
      gem 'brakeman', require: false
      gem 'bootstrap-sass'
      gem 'font-awesome-rails'
      gem 'annotate'
      gem 'stripe'

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
      system("rails g controller StaticPages index")
      route "root 'static_pages#index'"
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
