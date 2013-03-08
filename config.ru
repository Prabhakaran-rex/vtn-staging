require 'rubygems'
require 'bundler'
 
if ENV['DISABLE_FORWARD_PROXY']
 
  eval File.read(::File.expand_path('../vtn.ru',  __FILE__))
 
else
 
  $stdout.sync = true
  Bundler.require(:rack)
  
  port = (ARGV.first || ENV['PORT'] || 3000).to_i
  env = ENV['RACK_ENV'] || 'development'
 
  require 'em-proxy'
  require 'logger'
  require 'heroku-forward'
 
  #
  # Setup a reverse proxy for faster Heroku boot and future load-balancing.
  #
 
  application = File.expand_path('../vtn.ru', __FILE__)
  backend = Heroku::Forward::Backends::Thin.new(application: application, env: env)
  proxy = Heroku::Forward::Proxy::Server.new(backend, { host: '0.0.0.0', port: port })
  proxy.logger = Logger.new(STDOUT)
  proxy.forward!
 
end
