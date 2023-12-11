# config/deploy.rb

set :rvm_type, :user
set :rvm_ruby_version, '3.2.2'
set :rvm_custom_path, '/home/ubuntu/.rvm'

# Add the following line to load RVM
set :rvm_map_bins, fetch(:rvm_map_bins, []).push('bundle')

set :repo_url, 'git@github.com:testly-orgs/event_management_app_BE.git'
set :application, 'event-management'
set :user, 'ubuntu'

# Don't change these unless you know what you're doing
set :pty, true
set :use_sudo, true # Change this to false; sudo is not needed for RVM
set :stage, :production
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/app/#{fetch(:application)}"
set :passenger_restart_with_touch, true
set :log_level, :debug