require 'rails/generators'
module Bootsaas
  class DeviseGenerator < Rails::Generators::Base
    source_root File.expand_path("../devise_templates", __FILE__)

    def copy_assets
      directory "views/devise", "app/views/devise"
      directory "views/layouts", "app/views/layouts"
    end

    def layout_config
      insert_into_file 'config/application.rb', :after => "config.active_record.raise_in_transactional_callbacks = true" do
        "\n\nconfig.to_prepare do\n
          \tDevise::SessionsController.layout 'devise'\n
          \tDevise::ConfirmationsController.layout 'devise'\n
          \tDevise::UnlocksController.layout 'devise'\n
          \tDevise::PasswordsController.layout 'devise'\n
          \tDevise::RegistrationsController.layout proc{ |controller| user_signed_in? ? 'application' : 'devise' }\n
          \tDevise::Mailer.layout 'mailer'\n
        end"
      end
    end
  end
end