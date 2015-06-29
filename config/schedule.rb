rails_env = ENV['RAILS_ENV'] || :development

env :PATH, ENV['PATH']
set :path, ENV['PWD']
set :environment, rails_env
set :output, { error: 'log/crontab_error.log', standard: 'log/crontab.log' }
set :job_template, "/bin/zsh -l -c ':job'"
job_type :rake, "cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"

if @environment.to_sym == :production
  every :day, at: '5:00 am' do
    rake 'sitemap:refresh'
  end
end
