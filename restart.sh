passenger stop --pid-file tmp/pids/passenger.pid
bundle exec rake assets:precompile RAILS_ENV=production
source load-production-secrets.sh
passenger start -S tmp/server.socket -e production -d

