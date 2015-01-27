require 'rails/generators'
module Bootsaas
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)


    def copy_assets
      assets "assets", "app/assets"
    end
  end
end