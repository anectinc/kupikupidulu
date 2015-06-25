# coding: utf-8
worker_processes 8 # ワーカープロセス数
working_directory "/usr/local/services/kupikupidulu/current"

listen "/usr/local/services/kupikupidulu/shared/tmp/pids/unicorn.sock"
pid "/usr/local/services/kupikupidulu/shared/tmp/pids/unicorn.pid"

stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.clear_all_slave_connections!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_fresh_connection
end
