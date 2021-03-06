# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.

# port        ENV.fetch("PORT") { 3000 }

# # Specifies the `environment` that Puma will run in.

# environment ENV.fetch("RAILS_ENV") { "development" }

# # Specifies the `pidfile` that Puma will use.
# pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart


# ================set up to enforce ssl (for facebook login)========================
# Config Parameters
app_root = ENV['APP_ROOT'] || '.'
rails_env = ENV['RAILS_ENV'] || 'production'
ip_addr = ENV['IP_ADDR'] || 'localhost'
port = ENV['PORT'] || 3000
ssl_key = "config/ssl/server.key"
ssl_cert = "config/ssl/server.crt"

# Set Puma parameters
preload_app!
rackup DefaultRackup
environment rails_env
pidfile "#{app_root}/tmp/pids/puma.pid"
state_path "#{app_root}/tmp/pids/puma.state"
threads 0, 16
workers 2
stdout_redirect "#{app_root}/log/puma.log", "#{app_root}/log/puma.err", true if rails_env.downcase == 'production'

# HTTP or HTTPS
if ssl_key.present? && ssl_cert.present?
  bind "ssl://#{ip_addr}:#{port}?key=#{ssl_key}&cert=#{ssl_cert}"
else
  bind "tcp://#{ip_addr}:#{port}"
end
