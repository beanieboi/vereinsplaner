max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

port ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "development" }
workers ENV.fetch("RAILS_WORKERS") { 2 }

preload_app!

before_fork do
  Barnes.start # Must have enabled worker mode for this to block to be called
end

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

plugin :tmp_restart
