require 'rails/generators'
module Bootsaas
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../install_templates", __FILE__)

    def copy_assets
      directory "assets", "app/assets"
      directory "controllers", "app/controllers"
      directory "helpers", "app/helpers"
      directory "test", "test"
      directory "layouts", "app/views/layouts"
      directory "views", "app/views/static_pages"
      directory "vendor", "vendor"
    end

    def add_routes
      insert_into_file 'config/routes.rb', :after => "Rails.application.routes.draw do" do
        "\n  # BootSaaS routes for home page and coming soon landing page\n  root 'static_pages#index'\n  get 'coming_soon', to: 'static_pages#coming_soon', as: 'coming_soon'\n  get 'pricing', to: 'static_pages#pricing', as: 'pricing'\n"
      end
    end

    def append_to_manifest
      insert_into_file 'app/assets/javascripts/application.js', :after => "//= require jquery_ujs" do
        "\n//= require bootstrap\n"
      end

      insert_into_file 'app/assets/stylesheets/application.css', :before => "*= require_tree ." do
        "\n*= require bootstrap\n"
      end

      insert_into_file 'app/assets/stylesheets/application.css', :after => " */" do
        "\n\n@import 'font-awesome';"
      end

      copy_file "app/assets/stylesheets/application.css", "app/assets/stylesheets/application.scss"
      remove_file 'app/assets/stylesheets/application.css'
    end

    def add_gems
      append_to_file 'Gemfile' do
        "\ngem 'rails_12factor', group: :production\ngem 'brakeman'\ngem 'font-awesome-rails'"
      end
    end

    def add_padding_for_navbar
      append_to_file 'app/assets/stylesheets/application.scss' do
        "\n\nbody {\n
        \tmargin: 0;\n
        \tpadding: 0;\n
        \tpadding-top: 50px;\n
        }\n\n
        
        .container-dashboard {\n
          \tpadding-top: 20px;\n
        }"
      end
    end
  end
end