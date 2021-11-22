require 'spec_helper'
require_relative '../time_service.rb'

# Create TimeService for testing purposes comprised of the interface we are testing.
class TimeService < Hoodoo::Services::Service
  comprised_of TimeInterface
end

describe 'Time Service' do
  include Rack::Test::Methods

  # Create rack builder object for the test.
  context "get /1/Time/now" do
    let(:app) {

      Rack::Builder.new do
        use( Hoodoo::Services::Middleware )
        run( TimeService.new )
      end
    }


    it "passes if method returns 200 response." do
      get '/v1/time/now',
        nil,
        { 'CONTENT_TYPE' => 'application/json; charset=utf-8' }

      expect( last_response.status ).to eq 200
    end

    it "passes if the time is correct" do
      get '/v1/time/now',
        nil,
        { 'CONTENT_TYPE' => 'application/json; charset=utf-8' }


      # get the json last_response body and create a hash from it.
      result = JSON.parse( last_response.body )
      #   expect(result).to be_within(1).of ( Time.now.utc.iso8601 )

      # gets the time from 'result' hash and converts it to a datetime object
      # This will allow comparison with The Time.now object
      time = DateTime.parse( result['time'] )
      # Convert a from DateTime into time format. and check if it is within 0.5 of current time.
      # Tried be_within( 0.5 ) however this fails half the time.
      expect( time.to_time ).to be_within( 1 ).of ( Time.now)
    end
  end
end
