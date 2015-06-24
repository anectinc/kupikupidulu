env :PATH, ENV['PATH']
set :job_template, "zsh -l -c ':job'"
set :output, 'log/crontab.log'
set :environment, :production

every 1.day, at: '5:00 am' do
  rake '-s sitemap:refresh'
end
