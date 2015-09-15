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
        "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }"
      end
    end

    def generate_user_model
      system("rails g model User first_name:string last_name:string admin:boolean")
      # Add validations
      # Add admin default to migration
      if yes? "You should edit the migration and add a default to the admin boolean here so you don't have to set it every time.\nDo you want me to continue with the install anyway?"
        rake "db:migrate"
        system("rails g devise User")
        rake "db:migrate"
      else
        puts "Ok, edit the migration, then run rake db:migrate, followed by 'rails g devise User' to finish the devise installation"
      end
    end

    # Prompt user if they want to amend existing template to use devise routes?

    def create_admin_user
      if yes? "Would you like to add an admin user to the seeds.rb?"
        append_to_file 'db/seeds.rb' do
          fn = ask "First name: "
          ln = ask "Last name: "
          e = ask "Email: "
          p = ask "Password: "
          "User.create(\n\tfirst_name: '#{fn}',\n\tlast_name: '#{ln}',\n\temail: '#{e}',\n\tpassword: '#{p}',\n\tpassword_confirmation: '#{p}',\n\tadmin: true\n)\n\nputs 'Admin user created!'"
        end
        rake "db:seed"
      end
    end

    def route_logged_in_users
      if yes? "Would you like to route logged in users to their dashboard?"
        route "\n\tauthenticated :user do\n\t\troot :to => 'dashboard#index', :as => 'authenticated_root'\n\tend\n"
      end
    end

    def layout_config
      insert_into_file 'config/application.rb', :after => "config.active_record.raise_in_transactional_callbacks = true" do
        "\n\nconfig.to_prepare do\n
          \tdevise::sessionscontroller.layout 'devise'\n
          \tdevise::confirmationscontroller.layout 'devise'\n
          \tdevise::unlockscontroller.layout 'devise'\n
          \tdevise::passwordscontroller.layout 'devise'\n
          \tdevise::registrationscontroller.layout proc{ |controller| user_signed_in? ? 'dashboard' : 'devise' }\n
          \tdevise::mailer.layout 'mailer'\n
        end"
      end
    end
  end
end
