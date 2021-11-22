# config.ru
# run this with the `rackup` command

# run lambda { |env| ['200', {'Content-Type' => 'application/json; charset=utf-8'}, ['OK']] }
require_relative 'time_service.rb'
run( ::TimeService.new )
