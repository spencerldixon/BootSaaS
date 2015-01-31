require 'rails/generators'
module Bootsaas
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def copy_assets
      directory "assets", "app/assets"
      directory "controllers", "app/controllers"
      directory "helpers", "app/helpers"
      directory "test", "test"
      directory "layouts", "app/views/layouts"
      directory "views", "app/views/static_pages"
    end

    def add_routes
      insert_into_file 'config/routes.rb', :after => "Rails.application.routes.draw do" do
        "\n  # BootSaaS routes for home page and coming soon landing page\n  root 'static_pages#index'\n  get 'coming_soon', to: 'static_pages#coming_soon', as: 'coming_soon'\n  get 'pricing', to: 'static_pages#pricing', as: 'pricing'\n"
      end
    end

    def add_gems
      append_to_file 'Gemfile' do
        "\ngem 'rails_12factor', group: :production\ngem 'brakeman'"
      end
    end

    def add_padding_for_navbar
      append_to_file 'app/assets/stylesheets/application.css' do
        "body { padding-top: 30px; }"
      end
    end

    # Removed for now, will be in next release
    
    # def add_defaults_to_environments
    #   prepend_to_file 'config/secrets.yml', "# Any secrets here will be inhereted by all environments\n# Declaring it again in an environment will override it's default value\ndefault: &default\n\n"
    #   inject_into_file "config/secrets.yml", "\n\t<<: *default", :after => /development:/
    #   inject_into_file "config/secrets.yml", "\n\t<<: *default", :after => /test:/
    #   inject_into_file "config/secrets.yml", "\n\t<<: *default", :after => /production:/
    # end
  end
end