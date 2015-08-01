#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'production'

daemonize true

pidfile "/var/www/web/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/web/shared/tmp/log/stdout", "/var/www/web/shared/tmp/log/stderr"

threads 0, 16

bind "unix:///var/www/web/shared/tmp/sockets/puma.sock"
