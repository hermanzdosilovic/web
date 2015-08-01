require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :repository, 'git@github.com:hermanzdosilovic/web.git'
set :branch, 'master'

set :user, 'pi'
set :domain, 'gitac.local'
set :deploy_to, '/var/www/web'
set :port, '22219'
set :forward_agent, true

set :shared_paths, ['log', 'public/system']

set :app_path, lambda { "#{deploy_to}/#{current_path}" }

task setup: :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/system"]
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
      invoke :'puma:restart'
    end
  end
end

task :environment do
  invoke :'rbenv:load'
end

namespace :puma do
  desc "Start the application"
  task :start do
    queue 'echo "-----> Start Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && bin/puma.sh start", :pty => false
  end

  desc "Stop the application"
  task :stop do
    queue 'echo "-----> Stop Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && bin/puma.sh stop"
  end

  desc "Restart the application"
  task :restart do
    queue 'echo "-----> Restart Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && bin/puma.sh restart"
  end
end
