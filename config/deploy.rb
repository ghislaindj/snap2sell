load "deploy/assets"
default_run_options[:pty] = true

set :stages, %w(production)
require 'capistrano/ext/multistage'

# APPLICATION
set :application, "snap2sell"
set :user,        "#{application}"
set :use_sudo,    false
set :deploy_to,   "/home/#{application}/www"
set :deploy_via,  :remote_cache
set :keep_releases, 5

# GIT
set :repository,     "git@github.com:ghislaindj/#{application}.git"
set :scm,            :git
set :scm_username,   "git"

# BUNDLER
require "bundler/capistrano"

#set :default_env, 'production'
set(:rails_env) { "#{stage}" }

# Bonus! Colors are pretty!
def red(str)
  "\e[31m#{str}\e[0m"
end

after 'deploy:setup' do
  run "mkdir #{shared_path}/config"
  run "touch #{shared_path}/config/mongoid.yml"
end

namespace :deploy do
  desc "Reload the database with seed data"
  task :seed, :roles => :db do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:seed"
  end

  desc "Zero-downtime restart of Unicorn"
  task :restart, :except => { :no_release => true } do
    stop
    start
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
    run "cd #{current_path} ; RAILS_ENV=#{rails_env} bundle exec unicorn_rails -c config/unicorn/#{rails_env}.rb -D"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
    run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end  
end

namespace :db do
  desc "Drop the database"
  task :drop, :roles => :db do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:drop"
  end
end
require './config/boot'