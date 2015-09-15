require 'rails/generators'
module Bootsaas
  class InstallGenerator < Rails::Generators::Base
    def install
      system "rails g bootsaas:basic"
      system "rails g bootsaas:devise"
      system "rails g bootsaas:layout_admin_lte"
      system "rails g bootsaas:stripe"
    end
  end
end
