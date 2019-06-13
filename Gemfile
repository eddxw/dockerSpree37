# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 1.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'bullet'
  gem 'figaro'
  gem 'jazz_fingers'
  gem 'meta_request'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'activerecord-nulldb-adapter'

gem 'spree', '~> 3.7'
gem 'spree_auth_devise', '~> 3.5'
gem 'spree_gateway', '~> 3.4'

gem 'spree_admin_roles_and_access', github: 'vinsol-spree-contrib/spree_admin_roles_and_access'
gem 'spree_editor', github: 'spree-contrib/spree_editor'
gem 'spree_i18n', github: 'spree-contrib/spree_i18n'
gem 'spree_paypal_express', github: 'spree-contrib/better_spree_paypal_express'
gem 'spree_slider', github: 'spree-contrib/spree_slider'
gem 'spree_social', github: 'spree-contrib/spree_social'
gem 'spree_volume_pricing', github: 'spree-contrib/spree_volume_pricing'
gem 'tinymce-rails-langs'

gem 'barby', '~> 0.6.6'

gem 'spree_html_invoice', path: 'extensiones/spree-html-invoice'
# gem 'spree_html_invoice', github: 'eddxw/spree_html_invoice'
gem 'spree-point-of-sale', path: 'extensiones/spree-point-of-sale'
# gem 'spree-point-of-sale', github: 'eddxw/datatables_spree_point_of_sale'

gem 'semantic-ui-sass'

gem 'ajax-datatables-rails'
gem 'draper'
gem 'yajl-ruby', require: 'yajl'

gem 'spree_admin_activity_tracker', github: 'vinsol-spree-contrib/spree_admin_activity_tracker', branch: 'develop'
gem 'spree_order_events_tracker', github: 'vinsol-spree-contrib/spree_order_events_tracker', branch: 'develop'
gem 'vertical-timeline-rails'

gem 'csv'

gem 'spree_address_auto_complete', git: 'https://github.com/vinsol-spree-contrib/spree_address_auto_complete', branch: 'master'

gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'searchkick'
