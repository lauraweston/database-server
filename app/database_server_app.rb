require 'sinatra/base'
require_relative './models/database.rb'

class DatabaseServerApp < Sinatra::Base
  set :port, 4000

  before do
    @database = Database.instance
  end

  post '/set' do
    if @database.nil?
      @database = Database.create
    end
    params.each { |key, value|
      @database.add_pair(key, value)
    }
  end

  get '/get' do
    key = params[:key]
    value = @database.data[key.to_sym]
    "#{value}"
  end

  run! if app_file == $0
end
