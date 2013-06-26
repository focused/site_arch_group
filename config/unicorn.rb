

# ENV['RAILS_ENV'] = 'staging'
worker_processes(1)
preload_app true
user('hosting_nil','plex_users')
timeout 40
listen '/var/sockets/arch-group.nil.sock'
working_directory '/home/hosting_nil/projects/arch-group/current'
pid '/var/run/unicorn/arch-group.nil.pid'
stderr_path "/home/hosting_nil/projects/arch-group/current/log/unicorn.log"
stdout_path "/home/hosting_nil/projects/arch-group/current/log/unicorn.log"

GC.respond_to?(:copy_on_write_friendly=) and
GC.copy_on_write_friendly = true


before_fork do |server, worker|
   old_pid = "#{server.config[:pid]}.oldbin"
   if File.exists?(old_pid) && server.pid != old_pid
      begin
         Process.kill("QUIT", File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
      end
   end
end

after_fork do |server, worker|
  # reset rails cache to not share memcached
  Rails.cache.reset if Rails.cache.respond_to? :reset
  # PG errors (not for Mongo)
  ActiveRecord::Base.connection.reconnect! if (Gem.loaded_specs['mongo'].nil? && Gem.loaded_specs['mongoid'].nil?)
end

