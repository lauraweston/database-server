require 'rack/test'
require_relative '../app/database_server_app.rb'

describe DatabaseServerApp do
  include Rack::Test::Methods

  def app
    DatabaseServerApp
  end

  it "stores a query from the url path" do
    post "/set?somekey=somevalue"
    expect(last_response).to be_ok
    expect(last_response.body).to include "somekey"
    expect(last_response.body).to include "somevalue"
  end
end
