require 'rack/test'
require_relative '../app/database_server_app.rb'

describe DatabaseServerApp do
  include Rack::Test::Methods

  def app
    DatabaseServerApp
  end

  describe "post /set"  do
    before do
      Database.create
    end

    it "stores a query from the url path" do
      post "/set?somekey=somevalue"
      expect(last_response).to be_ok
    end

    it "stores the key and value in the database" do
      expect(Database.instance).to receive(:add_pair).with("somekey", "somevalue")
      post "/set?somekey=somevalue"
    end
  end

  describe "get /get" do
    it "has a status of ok" do
      get "/get"
      expect(last_response).to be_ok
    end

    it "given a query string with a key name, it returns the value of the key" do
      post "/set?somekey=somevalue"
      get "/get?key=somekey"
      expect(last_response.body).to eq "somevalue"
    end
  end
end
