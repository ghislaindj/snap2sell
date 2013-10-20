# SERVERS
role :web, "mojito.milky.fr"
role :app, "mojito.milky.fr"            
role :db, "mojito.milky.fr", :primary => true  # This is where Rails migrations will run

# GIT
set :branch,         'master'

set :rvm_ruby_string, 'ruby-2.0.0-p247'
set :rvm_type, :user

set :deploy_to,   "/home/#{application}/www"

before 'deploy:setup', 'rvm:install_rvm'  # install/update RVM
before 'deploy:setup', 'rvm:install_ruby' # install Ruby and create gemset (both if missing)

require "rvm/capistrano"