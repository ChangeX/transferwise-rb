$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'transferwise'

require 'webmock/rspec'

def stub_authed_request(method, action, access_token)
  stub_request(method, 'https://api.wise-sandbox.com' + action)
    .with(
      headers: {
        'Authorization' => "Bearer #{access_token}",
        'Content-Type' => 'application/json'
      }
    )
end
