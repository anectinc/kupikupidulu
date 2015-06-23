# config valid only for current version of Capistrano
lock '3.3.5'

Rake::Task['metrics:collect'].clear_actions

set :application, 'kupikupidulu'
set :repo_url, "git@github.com:anectinc/#{fetch(:application)}.git"

# Default branch is :master
set :branch, :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/usr/local/services/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/slave.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'public/sitemaps')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# for whenever
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles, -> { :batch }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  task :updater_sync do
    # on roles(:app), in: :sequence do
    #   within release_path do
    #   end
    # end
  end

  after :migrate, :updater_sync
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
