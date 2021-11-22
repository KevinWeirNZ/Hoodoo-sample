require 'spec_helper'
require 'spec_support'


context '#show' do
  # include Rack::Test::Methods


  it "tests if it returns 200" do

    response = get(
      '/v1/time/now',
      nil,
      { 'CONTENT_TYPE' => 'application/json; charset=utf-8' }
    )

    expect( response.status.to_s ).to(
          eq( 200.to_s ),
          "Expected status code '#{ 200 }', got '#{ response.status }' with body: #{ response.body }"
        )

    # expect( response.body.to_ ).to be_within( 0.5 ).of ( Time.now.iso8601 )
  end
end






# def do_show( expected_code = 200 )
#   response = get(
#     "/v1/time/now/",
#     nil,
#     { 'CONTENT_TYPE' => 'application/json; charset=utf-8' }
#   )

#   expect( response.status.to_s ).to(
#     eq( expected_code.to_s ),
#     "Expected status code '#{ expected_code }', got '#{ response.status }' with body: #{ response.body }"
#   )

#   return response.body
# end


# it 'checks if the result is within a time range' do
#   result = do_show()
#   expect(result).to be_within(1).of ( Time.now.utc.iso8601 )

# end