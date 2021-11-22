require 'rack'
require 'hoodoo'


# This is the implementation class.
# the implementation class is refered to by the interface class therefore, Implementation class must be defined first.
# naming convention: FooImplementation.
class TimeImplementation < Hoodoo::Services::Implementation
  def show( context )
    context.response.set_resource( { 'time' => Time.now.utc.iso8601 } )
  end
end

# This is the interface class.
# The interface class takes the name of the resource and a block which describes the resource.
class TimeInterface < Hoodoo::Services::Interface
  interface :Time do                            # name of resource as a symbol.
  endpoint :time, TimeImplementation            # define the endpoint of the resource using uri fragment time followed by the implementation class name. interface version is not specified. URI defaults to path of .../v1/time
  public_actions :show                          # public_actions calls the show method found in the TimeImplementation class.
  end
end

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