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
end
