#app
server '18.191.78.156', user: 'ubuntu', roles: %w{app db web}

set :branch, 'main'
set :deploy_to, '/var/www/Event-Management'
set :stage, :production
set :rails_env, 'production'
