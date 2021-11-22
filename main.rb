require 'rack'
require 'hoodoo'
require_relative 'time_service.rb'

# This is the service class.
# It declares all the resource interfaces that exist within the service application.
class TimeService < Hoodoo::Services::Service
  comprised_of TimeInterface
end

# This is a hack for the example and needed if you have Active Record present,
# else Hoodoo will expect a database connection.

Object.send( :remove_const, :ActiveRecord ) rescue nil


# Tell rack to use the thin webserver on port 9292
builder = Rack::Builder.new do
  use( Hoodoo::Services::Middleware )
  run( TimeService.new )
end

Rack::Handler::Thin.run( builder, :Port => 9292 )