require 'rails/generators'
module Bootsaas
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)


    def copy_assets
      assets "assets", "app/assets"
    end

    # def add_assets_to_manifest
    #   insert_into_file 'app/assets/stylesheets/application.css', :after => "//= require turbolinks" do
    #     '//= require bootstrap'
    #     '//= require bootstrap.min'
    #   end

    #   insert_into_file 'app/assets/javascripts/application.js', :after => "*= require_self" do
    #     '*= require bootstrap'
    #     '*= require bootstrap.min'
    #     '*= require landing-page'
    #   end
    # end
  end
end