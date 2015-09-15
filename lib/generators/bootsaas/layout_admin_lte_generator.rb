require 'rails/generators'
module Bootsaas
  class LayoutAdminLteGenerator < Rails::Generators::Base
    source_root File.expand_path("../layout_admin_lte_templates", __FILE__)

    def copy_home_files
      copy_file "cbpAnimatedHeader.js", "vendor/assets/javascripts/cbpAnimatedHeader.js"
      copy_file "classie.js", "vendor/assets/javascripts/classie.js"
      copy_file "creative.js", "vendor/assets/javascripts/creative.js"
      copy_file "wow.min.js", "vendor/assets/javascripts/wow.min.js"
      copy_file "creative.scss", "vendor/assets/stylesheets/creative.scss"
      copy_file "home.html.erb", "app/views/layouts/home.html.erb"
    end

    def copy_dashboard_files
      copy_file "_all-skins.scss", "vendor/assets/stylesheets/_all-skins.scss"
      copy_file "AdminLTE.css", "vendor/assets/stylesheets/AdminLTE.css"
      copy_file "bootsaas_colors.scss", "vendor/assets/stylesheets/bootsaas_colors.scss"
      copy_file "bootsaas_dash.scss", "vendor/assets/stylesheets/bootsaas_dash.scss"
      copy_file "adminlte.js", "vendor/assets/javascripts/adminlte.js"
      copy_file "dashboard.html.erb", "app/views/layouts/dashboard.html.erb"
    end

    def copy_devise_layout
      if yes? "Would you like to install the devise layout to use with devise?"
        copy_file "devise.html.erb", "app/views/layouts/devise.html.erb"
      end
    end

    def append_dashboard_to_manifest
      append_to_file 'app/assets/javascripts/application.js', "\n//= require adminlte"
      append_to_file 'app/assets/stylesheets/application.css.scss', "\n@import 'AdminLTE';\n@import '_all-skins';"
    end

    def append_home_to_manifest
      append_to_file 'app/assets/javascripts/application.js', "\n//= require cbpAnimatedHeader"
      append_to_file 'app/assets/javascripts/application.js', "\n//= require classie"
      append_to_file 'app/assets/javascripts/application.js', "\n//= require creative"
      append_to_file 'app/assets/javascripts/application.js', "\n//= require wow.min"
      append_to_file 'app/assets/stylesheets/application.css.scss', "\n@import 'creative';"
    end

    def add_application_title_to_files
      name = ask "What should your application be titled?"
      gsub_file "app/views/layouts/dashboard.html.erb", "BootSaaS", "#{name}"
      gsub_file "app/views/layouts/home.html.erb", "BootSaaS", "#{name}"
      gsub_file "app/views/layouts/devise.html.erb", "BootSaaS", "#{name}"
    end

    def secure_dashboard_controller
      inject_into_class "app/controllers/dashboard_controller.rb", DashboardController do
          "\tlayout 'dashboard'\n\tbefore_action :authenticate_user!\n"
      end

      # DO you want to use stripe?
      # Run stripe generator
    end

    def edit_static_pages_controller
      inject_into_class "app/controllers/static_pages_controller.rb", StaticPagesController do
        "\tlayout 'home'\n"
      end
    end

    def devise_layouts
      if yes? "Would you like to install devise layouts?"
        puts "Do it yourself."
        # install devise layouts folder
        # add conditional routes to application.rb
        # create devise controller
        # add devise controller in routes.rb
      end
    end
  end
end

