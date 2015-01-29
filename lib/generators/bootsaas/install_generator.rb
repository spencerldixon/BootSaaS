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
        "\n  # BootSaaS routes for home page and coming soon landing page\n  root 'static_pages#index'\n  get 'coming_soon', to: 'static_pages#coming_soon', as: 'coming_soon'\n"
      end
    end
  end
end