require 'rails/generators'
module Bootsaas
  class DeviseGenerator < Rails::Generators::Base
    source_root File.expand_path("../devise_templates", __FILE__)

    def install_gem
      gem 'devise'
      Bundler.with_clean_env do
        run "bundle install"
      end
      system("rails g devise:install")
      environment(nil, env: "development") do
        config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
      end
    end

    def generate_user_model
      system("rails g model User first_name:string last_name:string admin:boolean")
      # Add validations
      # Add admin default to migration
      rake "db:migrate"
      system("rails g devise User")
    end

    def copy_assets
    end

    def add_to_existing
      # Prompt user if they want to amend existing template to use devise routes?
    end

#    def copy_assets
      #directory "views/devise", "app/views/devise"
      #directory "views/layouts", "app/views/layouts"
    #end

    #def layout_config
      #insert_into_file 'config/application.rb', :after => "config.active_record.raise_in_transactional_callbacks = true" do
        #"\n\nconfig.to_prepare do\n
          #\tDevise::SessionsController.layout 'devise'\n
          #\tDevise::ConfirmationsController.layout 'devise'\n
          #\tDevise::UnlocksController.layout 'devise'\n
          #\tDevise::PasswordsController.layout 'devise'\n
          #\tDevise::RegistrationsController.layout proc{ |controller| user_signed_in? ? 'application' : 'devise' }\n
          #\tDevise::Mailer.layout 'mailer'\n
        #end"
      #end
    #end
  end
end
