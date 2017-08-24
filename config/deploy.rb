# config valid only for current version of Capistrano
lock '3.9.0'

set :application, 'horton-bot'
set :repo_url, 'git@github.com:ucsdlib/horton-bot.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, 'pub/horton-bot'

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w[rake gem bundle ruby]
append :rbenv_map_bins, 'rake', 'gem', 'bundle', 'ruby', 'puma', 'pumactl'
set :rbenv_roles, :all # default value

# TODO: Puma defaults below. Adjust once have a VM to test on
# https://github.com/seuros/capistrano-puma/blob/master/README.md#other-configs

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/sockets'
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
