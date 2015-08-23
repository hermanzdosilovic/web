require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :user, 'titus'
set :repository, 'git@github.com:hermanzdosilovic/web.git'
set :forward_agent, true

task :production do
  set :domain, 'hermanzdosilovic.me'
  set :deploy_to, '/var/www/web_production'
  set :rails_env, 'production'
  set :branch, 'master'
end

task :staging do
  set :domain, 'staging.hermanzdosilovic.me'
  set :deploy_to, '/var/www/web_staging'
  set :rails_env, 'staging'
  set :branch, 'development'
end

set :shared_paths, %w{.env log}

task setup: :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]
end

desc "Deploys the current version to the server."
task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
  end
end

task :environment do
  invoke :'rbenv:load'
end
